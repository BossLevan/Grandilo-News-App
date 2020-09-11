part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

//when the user isnt authenticated
class UnAuthenticated extends AuthState {}

//when the user is authenticated
class Authenticated extends AuthState {
  final User user;

  Authenticated({this.user});
}
