import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'newspaper_screen.dart';
import 'magazine_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentTabIndex = 0;
  final List<String> tabs = ['News', 'Magazines'];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('BdNewsHub'),
        actions: [
          PopupMenuButton<AppTheme>(
            onSelected: (AppTheme theme) {
              themeProvider.switchTheme(theme);
            },
            icon: Icon(Icons.color_lens),
            itemBuilder: (context) => [
              PopupMenuItem(value: AppTheme.Light, child: Text("Light Theme")),
              PopupMenuItem(value: AppTheme.Dark, child: Text("Dark Theme")),
              PopupMenuItem(value: AppTheme.Blue, child: Text("Blue Theme")),
              PopupMenuItem(value: AppTheme.Elegant, child: Text("Elegant Theme")),
            ],
          )
        ],
      ),
      body: Column(
        children: [
          // Breaking News Banner
          Container(
            margin: EdgeInsets.all(16),
            child: _buildBreakingNewsBanner(),
          ),
          // Tabs
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
              itemBuilder: (context, index) {
                bool isActive = index == _currentTabIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentTabIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isActive ? Theme.of(context).primaryColor : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Content List
          Expanded(
            child: _currentTabIndex == 0 ? NewspaperScreen() : MagazineScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildBreakingNewsBanner() {
    // Dummy banner for demonstration
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [Colors.red, Colors.orange]),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.flash_on, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Breaking News: Major update on DreamSD platform!",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(Icons.chevron_right, color: Colors.white),
        ],
      ),
    );
  }
}
