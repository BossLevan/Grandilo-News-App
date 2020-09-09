import 'dart:convert';
import 'package:grandilo_news_app/core/models/news_list_model.dart';
import 'package:http/http.dart' as http;

class NewsApiClient {
  final http.Client _httpClient;
  static const baseUrl = 'https://newsapi.org/v2/top-headlines?';
  static const apiKey = '823e1560aecd4130a2c8f2a34c807dad';
  static const apiKey2 = '5f824016bf594ed7abe6695252395273';
  static const country = 'us';

  NewsApiClient({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<NewsList> getNewsList() async {
    try {
      final jsonResponse =
          await _httpClient.get('${baseUrl}country=$country&apiKey=$apiKey2');
      //print(jsonResponse.body);
      if (jsonResponse.statusCode == 200) {
        Map<String, dynamic> result = json.decode(jsonResponse.body);

        NewsList newsList = NewsList.fromJson(result);
        newsList.news.removeWhere((element) {
          return element.imageUrl == null;
        });

        return newsList;
      }
    } catch (e) {
      throw (e);
    }
  }
}
