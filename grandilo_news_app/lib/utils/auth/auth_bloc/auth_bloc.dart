import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grandilo_news_app/core/models/user_model.dart';
import 'package:grandilo_news_app/core/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;
  AuthBloc({this.userRepository}) : super(UnAuthenticated());

  AuthState get initialState => UnAuthenticated();
  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await userRepository.boolSignedIn();
      if (isSignedIn) {
        final user = await userRepository.getUser();
        yield Authenticated(user: user);
      } else {
        yield UnAuthenticated();
      }
    } catch (_) {
      yield UnAuthenticated();
    }
  }

  Stream<AuthState> _mapLoggedInToState() async* {
    final user = await userRepository.getUser();
    yield Authenticated(user: user);
  }

  Stream<AuthState> _mapLoggedOutToState() async* {
    yield UnAuthenticated();
    userRepository.logOut();
  }
}
