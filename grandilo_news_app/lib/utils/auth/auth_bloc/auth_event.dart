part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//event when app starts
class AppStarted extends AuthEvent {
  @override
  String toString() => 'AppStarted';
}

//login event
class LoggedIn extends AuthEvent {}

//signup event
class SignedUp extends AuthEvent {}

//loggedout event
class LoggedOut extends AuthEvent {}
