part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent extends Equatable {
  const DetailsEvent();
  @override
  List<Object> get props => [];
}

//event to trigger a loaded state
class DetailsLoadedEvent extends DetailsEvent {
  final News news;
  DetailsLoadedEvent({this.news});

  @override
  List<Object> get props => [news];
}

//event ot trigger error state
class DetailsError extends DetailsEvent {}
