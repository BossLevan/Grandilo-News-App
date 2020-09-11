part of 'details_bloc.dart';

@immutable
abstract class DetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

//before the news url is shown
class DetailsInitial extends DetailsState {}

//when the news detail is loading
class DetailsLoadingState extends DetailsState {}

//when the details is done loading
class DetailsLoadedState extends DetailsState {
  final News news;
  DetailsLoadedState({this.news});

  @override
  List<Object> get props => [news];
}

//when there is an error
class DetailsErrorState extends DetailsState {}
