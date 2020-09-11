import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:grandilo_news_app/core/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;
  SignupBloc(this.userRepository) : super(SignupState.empty());

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is Submitted) {
      yield* _mapSignupWithCredentialsPressedToState(
        email: event.email,
        password: event.password,
      );
    }
  }

  Stream<SignupState> _mapSignupWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield SignupState.loading();
    try {
      await userRepository.signUp(email, password);
      yield SignupState.success();
    } catch (_) {
      yield SignupState.failure();
    }
  }
}
