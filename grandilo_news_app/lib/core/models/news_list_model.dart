import 'package:grandilo_news_app/core/models/news_model.dart';

class NewsList {
  List<News> news;

  NewsList({this.news});

  factory NewsList.fromJson(Map<String, dynamic> json) {
    var newss = json['articles'] as List;

    List<News> newsList = newss.map((i) => News.fromJson(i)).toList();
    // print(newsList[0].description);
    return NewsList(
      news: newsList,
    );
  }
}
