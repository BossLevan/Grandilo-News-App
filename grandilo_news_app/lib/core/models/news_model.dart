import 'package:grandilo_news_app/core/models/news_source_model.dart';

class News {
  String title;
  Source source;
  String author;
  String description;
  String url;
  String imageUrl;
  String publishTime;
  String content;

  News(
      {this.title,
      this.author,
      this.content,
      this.description,
      this.imageUrl,
      this.publishTime,
      this.source,
      this.url});

  factory News.fromJson(Map<String, dynamic> parsedJson) {
    return News(
        source: Source.fromJson(parsedJson['source']),
        author: parsedJson['author'],
        description: parsedJson['description'],
        url: parsedJson['url'],
        imageUrl: parsedJson['urlToImage'],
        publishTime: parsedJson['publishedAt'],
        content: parsedJson['content']);
  }
}
