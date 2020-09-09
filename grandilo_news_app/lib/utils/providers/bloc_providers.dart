import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandilo_news_app/core/repositories/news_repository.dart';
import 'package:grandilo_news_app/core/services/news_api_client.dart';
import 'package:grandilo_news_app/screens/home_screen/bloc/homescreen_bloc.dart';
import 'package:provider/single_child_widget.dart';

final providers = [
  RepositoryProvider(
    create: (context) => NewsRepository(newsApiClient: NewsApiClient()),
    child: BlocProvider<HomescreenBloc>(
      create: (context) =>
          HomescreenBloc(RepositoryProvider.of<NewsRepository>(context)),
    ),
  ),
];
