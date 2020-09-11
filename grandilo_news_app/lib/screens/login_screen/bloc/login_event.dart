part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

//Event when the log in button is pressed
class LoginSubmitted extends LoginEvent {
  final String email;
  final String password;

  LoginSubmitted({@required this.email, @required this.password});

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }

  @override
  List<Object> get props => [email, password];
}
