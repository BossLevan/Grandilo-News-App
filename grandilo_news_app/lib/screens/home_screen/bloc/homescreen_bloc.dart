import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grandilo_news_app/core/models/news_list_model.dart';
import 'package:grandilo_news_app/core/models/news_model.dart';
import 'package:grandilo_news_app/core/repositories/news_repository.dart';
import 'package:meta/meta.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  NewsRepository newsRepository;

  HomescreenBloc(this.newsRepository) : super(HomescreenLoading());

  @override
  Stream<HomescreenState> mapEventToState(
    HomescreenEvent event,
  ) async* {
    if (event is OnNavToHomeScreen) {
      yield HomescreenLoading();
      try {
        //retrieving data from the repo
        final newsList = await newsRepository.getNewsList();
        yield HomescreenLoaded(newsList: newsList);
      } catch (e) {
        yield HomescreenError(message: e.toString());
      }
    }
    if (event is OnNavToDetailsScreen) {
      yield NavToDetailsScreenComplete(news: event.news);
    }
  }
}
