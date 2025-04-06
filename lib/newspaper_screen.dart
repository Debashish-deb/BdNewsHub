import 'package:flutter/material.dart';
import 'widgets/newspaper_card.dart';
import 'article_screen.dart';

class NewspaperScreen extends StatelessWidget {
  final List<Map<String, String>> newspapers = [
    {
      'id': '1',
      'title': 'Prothom Alo',
      'description': 'Leading Bengali daily newspaper',
      'image': 'https://via.placeholder.com/150',
      'url': 'https://www.prothomalo.com/'
    },
    {
      'id': '2',
      'title': 'Bangladesh Pratidin',
      'description': 'Popular Bengali daily newspaper',
      'image': 'https://via.placeholder.com/150',
      'url': 'https://www.bd-pratidin.com/'
    },
    // Add more dummy newspapers if needed.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Newspapers"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: newspapers.length,
        itemBuilder: (context, index) {
          final newspaper = newspapers[index];
          return NewspaperCard(
            title: newspaper['title']!,
            description: newspaper['description']!,
            imageUrl: newspaper['image']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleScreen(
                    title: newspaper['title']!,
                    url: newspaper['url']!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
