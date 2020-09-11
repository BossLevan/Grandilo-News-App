part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenEvent extends Equatable {
  const HomescreenEvent();
  @override
  List<Object> get props => [];
}

//shoots an event when you tap on the individual news
class OnNewsTappedEvent extends HomescreenEvent {}

//intially used as a test event
class OnNavToHomeScreen extends HomescreenEvent {}

//event that fires when you tap on an individual news
class OnNavToDetailsScreen extends HomescreenEvent {
  final News news;
  OnNavToDetailsScreen({this.news});

  @override
  List<Object> get props => [news];
}

//event when you refresh = coming soon
class OnRefresh extends HomescreenEvent {}
