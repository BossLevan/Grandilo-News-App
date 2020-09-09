import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandilo_news_app/core/repositories/news_repository.dart';
import 'package:grandilo_news_app/core/services/news_api_client.dart';
import 'package:grandilo_news_app/screens/home_screen/bloc/homescreen_bloc.dart';
import 'package:grandilo_news_app/utils/constants/routes/route_generator.dart';
import 'package:grandilo_news_app/utils/constants/routes/routes.dart';
import 'package:grandilo_news_app/utils/providers/bloc_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(newsApiClient: NewsApiClient()),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<HomescreenBloc>(
            create: (context) =>
                HomescreenBloc(RepositoryProvider.of<NewsRepository>(context)),
          ),
        ],
        child: MainApp(),
      ),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      initialRoute: RouteNames.homeScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
