import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';

import 'event.dart';
import 'state.dart';

@Singleton()
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required IAuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<AuthenticationLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthenticationLoginRequest>(_onAuthenticationLoginRequested);
    _authenticationStatusSubscription = _authenticationRepository.status.listen(
      (status) => add(AuthenticationStatusChanged(status)),
    );
    debugPrint('Initial status ${state.status.toString()}');
  }

  final IAuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus>
      _authenticationStatusSubscription;

  @override
  Future<void> close() {
    debugPrint("Auth Bloc close called");
    _authenticationStatusSubscription.cancel();
    _authenticationRepository.dispose();
    return super.close();
  }

  Future<void> _onAuthenticationLoginRequested(AuthenticationLoginRequest event,
      Emitter<AuthenticationState> emit) async {
    if (state.status == AuthenticationStatus.authenticated) return;

    try {
      final user = await _authenticationRepository.logIn(
          email: event.email, password: event.password);

      emit(AuthAuthenticatedState(user));
    } catch (_) {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  Future<void> _onAuthenticationStatusChanged(
    AuthenticationStatusChanged event,
    Emitter<AuthenticationState> emit,
  ) async {
    switch (event.status) {
      case AuthenticationStatus.unauthenticated:
        return emit(const AuthenticationState.unauthenticated());
      case AuthenticationStatus.authenticated:
        return emit(const AuthenticationState.authenticated());
      case AuthenticationStatus.unknown:
        return emit(const AuthenticationState.unknown());
      case AuthenticationStatus.loggingIn:
        // TODO: Handle this case.
        break;
      case AuthenticationStatus.loggingOut:
        // TODO: Handle this case.
        break;
    }
    //_authenticationStatus = event.status;
  }

  void _onAuthenticationLogoutRequested(
    AuthenticationLogoutRequested event,
    Emitter<AuthenticationState> emit,
  ) {
    _authenticationRepository.logOut();
  }
}
