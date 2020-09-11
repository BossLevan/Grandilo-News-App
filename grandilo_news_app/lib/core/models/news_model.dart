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

  News({
    this.title,
    this.author,
    this.content,
    this.description,
    this.imageUrl,
    this.publishTime,
    this.source,
    this.url,
  });

  //factory constructor to lazily create a new instance
  //of the individual news
  factory News.fromJson(Map<String, dynamic> parsedJson) {
    return News(
      source: Source.fromJson(parsedJson['source']),
      author: parsedJson['author'] as String,
      description: parsedJson['description'] as String,
      url: parsedJson['url'] as String,
      imageUrl: parsedJson['urlToImage'] as String,
      publishTime: parsedJson['publishedAt'] as String,
      content: parsedJson['content'],
      title: parsedJson['title'] as String,
    );
  }
}
