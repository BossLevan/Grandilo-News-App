part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomescreenLoading extends HomescreenState {}

class HomescreenLoaded extends HomescreenState {
  final NewsList newsList;
  HomescreenLoaded({this.newsList});
  @override
  List<Object> get props => [newsList];
}

class HomescreenError extends HomescreenState {
  final String message;

  HomescreenError({this.message});
  @override
  List<Object> get props => [message];
}

class HomescreenOnRefresh extends HomescreenState {}

class NavToDetailsScreenComplete extends HomescreenState {
  final News news;
  NavToDetailsScreenComplete({this.news});

  @override
  List<Object> get props => [news];
}

class HomescreenOnBottomRefresh extends HomescreenState {}
