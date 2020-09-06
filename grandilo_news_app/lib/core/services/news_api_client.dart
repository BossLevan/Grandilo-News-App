import 'dart:convert';
import 'package:grandilo_news_app/core/models/news_list_model.dart';
import 'package:http/http.dart' as http;

class NewsApiClient {
  final http.Client _httpClient;
  static const baseUrl = 'https://newsapi.org/v2/top-headlines?';
  static const apiKey = '823e1560aecd4130a2c8f2a34c807dad';
  static const country = 'ng';

  NewsApiClient({http.Client httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<NewsList> getNewsList() async {
    try {
      final jsonResponse =
          await _httpClient.get('$baseUrl/country=$country/&apiKey=$apiKey');
      if (jsonResponse.statusCode == 200) {
        final result = jsonDecode(jsonResponse.body);
        NewsList newsList = NewsList.fromJson(result);
        return newsList;
      }
    } catch (e) {
      throw (e);
    }
  }
}
