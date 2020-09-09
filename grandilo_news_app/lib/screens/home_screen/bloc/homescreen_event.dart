part of 'homescreen_bloc.dart';

@immutable
abstract class HomescreenEvent extends Equatable {
  const HomescreenEvent();
  @override
  List<Object> get props => [];
}

class OnNewsTappedEvent extends HomescreenEvent {}

class OnNavToHomeScreen extends HomescreenEvent {}

class OnNavToDetailsScreen extends HomescreenEvent {}

class OnRefresh extends HomescreenEvent {}
