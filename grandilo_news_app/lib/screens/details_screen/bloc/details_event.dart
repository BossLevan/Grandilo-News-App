part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
  @override
  List<Object> get props => [];
}

class DetailsLoadedEvent extends DetailsEvent {
  final News news;
  DetailsLoadedEvent({this.news});

  @override
  List<Object> get props => [news];
}

class DetailsError extends DetailsEvent {}
