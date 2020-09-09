import 'package:flutter/material.dart';
import 'package:grandilo_news_app/core/models/news_model.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;

  NewsDetailScreen(this.news);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Image.network(news.imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}
