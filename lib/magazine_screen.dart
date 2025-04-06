import 'package:flutter/material.dart';
import 'widgets/magazine_card.dart';
import 'article_screen.dart';

class MagazineScreen extends StatelessWidget {
  final List<Map<String, String>> magazines = [
    {
      'id': '1',
      'title': 'Magazine One',
      'description': 'Latest trends in fashion and style',
      'image': 'https://via.placeholder.com/150',
      'url': 'https://example.com/magazine1'
    },
    {
      'id': '2',
      'title': 'Magazine Two',
      'description': 'Tech and innovation in focus',
      'image': 'https://via.placeholder.com/150',
      'url': 'https://example.com/magazine2'
    },
    // Add more dummy magazines if needed.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Magazines"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: magazines.length,
        itemBuilder: (context, index) {
          final magazine = magazines[index];
          return MagazineCard(
            title: magazine['title']!,
            description: magazine['description']!,
            imageUrl: magazine['image']!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleScreen(
                    title: magazine['title']!,
                    url: magazine['url']!,
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
