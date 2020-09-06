import 'package:grandilo_news_app/core/models/news_model.dart';

class NewsList {
  List<News> news;

  NewsList({this.news});

  factory NewsList.fromJson(dynamic json) {
    List<News> news = json.map((i) => News.fromJson(json)).toList();
    return NewsList(
      news: news,
    );
  }
}
