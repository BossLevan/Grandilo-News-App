part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {}

//when you submit your details for auth
class Submitted extends SignupEvent {
  final String email;
  final String password;

  Submitted({@required this.email, @required this.password});

  @override
  String toString() {
    return 'Submitted { email: $email, password: $password }';
  }

  @override
  List<Object> get props => [email, password];
}
