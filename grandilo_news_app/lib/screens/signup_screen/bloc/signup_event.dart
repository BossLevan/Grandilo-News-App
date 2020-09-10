part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent extends Equatable {}

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

class FocusEvent extends SignupEvent {
  final BuildContext context;
  final FocusScopeNode node;

  FocusEvent({this.context, this.node});

  @override
  List<Object> get props => [context, node];
}
