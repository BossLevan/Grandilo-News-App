import 'package:grandilo_news_app/core/models/news_list_model.dart';
import 'package:grandilo_news_app/core/services/news_api_client.dart';
import 'package:meta/meta.dart';

class NewsRepository {
  NewsApiClient newsApiClient;

  NewsRepository({@required this.newsApiClient})
      : assert(newsApiClient != null);

  Future<NewsList> getNewsList() async {
    return await newsApiClient.getNewsList();
  }
}
