import 'package:grandilo_news_app/core/models/news_model.dart';

//model for the list of news retireved from the api
class NewsList {
  List<News> news;

  NewsList({this.news});

  //factory constructor to lazily create a new instance
  //of the news list
  factory NewsList.fromJson(Map<String, dynamic> json) {
    var newss = json['articles'] as List;

    List<News> newsList = newss.map((i) => News.fromJson(i)).toList();
    return NewsList(
      news: newsList,
    );
  }
}
