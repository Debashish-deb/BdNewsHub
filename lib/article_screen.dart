import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share_plus/share_plus.dart';

class ArticleScreen extends StatefulWidget {
  final String title;
  final String url;
  ArticleScreen({required this.title, required this.url});
  
  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  bool _isLoading = true;
  String? _error;
  late final WebViewController _controller;
  
  @override
  void initState() {
    super.initState();
    // Create and configure the WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              _isLoading = true;
              _error = null;
            });
          },
          onPageFinished: (url) {
            setState(() {
              _isLoading = false;
            });
          },
          onWebResourceError: (error) {
            setState(() {
              _error = error.description;
              _isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              Share.share(widget.url, subject: widget.title);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Use the updated WebViewWidget instead of WebView
          WebViewWidget(controller: _controller),
          if (_isLoading)
            Center(child: CircularProgressIndicator()),
          if (_error != null)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error, size: 50, color: Colors.red),
                  SizedBox(height: 8),
                  Text("Error: $_error"),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reload();
                    },
                    child: Text("Retry"),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
