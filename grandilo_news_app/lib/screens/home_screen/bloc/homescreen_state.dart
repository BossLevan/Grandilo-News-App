part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenState extends Equatable {
  @override
  List<Object> get props => [];
}

//when the home screen is loading news
class HomescreenLoading extends HomescreenState {}

//after news is loaded
class HomescreenLoaded extends HomescreenState {
  final NewsList newsList;
  HomescreenLoaded({this.newsList});
  @override
  List<Object> get props => [newsList];
}

//if there wads an error getting news
class HomescreenError extends HomescreenState {
  final String message;

  HomescreenError({this.message});
  @override
  List<Object> get props => [message];
}

//coming soon
class HomescreenOnRefresh extends HomescreenState {}

//what shows when you navigate to the news detail screen
class NavToDetailsScreenComplete extends HomescreenState {
  final News news;
  NavToDetailsScreenComplete({this.news});

  @override
  List<Object> get props => [news];
}

//coming soon
class HomescreenOnBottomRefresh extends HomescreenState {}
