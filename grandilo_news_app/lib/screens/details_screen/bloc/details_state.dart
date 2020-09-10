part of 'details_bloc.dart';

@immutable
abstract class DetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class DetailsInitial extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsLoadedState extends DetailsState {
  final News news;
  DetailsLoadedState({this.news});

  @override
  List<Object> get props => [news];
}

class DetailsErrorState extends DetailsState {}
