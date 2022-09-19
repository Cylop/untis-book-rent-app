import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';
import 'package:untis_book_rent_app/ui/state/repositories/no-user.exception.dart';

import 'event.dart';
import 'state.dart';

@Singleton()
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  late final AuthRepository _authRepository;

  AuthenticationBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthenticationInitial()) {
    on<AppLoaded>(_onAppLoaded);
    on<UserLoggedIn>(_onUserLoggedIn);
    on<UserLoggedOut>(_onUserLoggedOut);

    debugPrint('Initial status ${state.status.toString()}');
  }

  Future<void> _onAppLoaded(
      AppLoaded event, Emitter<AuthenticationState> emit) async {
    try {
      final currentUser = await _authRepository.loadCurrentUser();

      if (currentUser == StateUser.empty) {
        emit(AuthenticationAuthenticated(user: currentUser));
      } else {
        emit(const AuthenticationUnAuthenticated());
      }
    } on NoUserException {
      emit(const AuthenticationUnAuthenticated());
    } catch (e) {
      emit(const AuthenticationFailure(
          message: /*e.message ??*/ 'An unknown error occurred'));
    }
  }

  Future<void> _onUserLoggedIn(
      UserLoggedIn event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationAuthenticated(user: event.user));
  }

  Future<void> _onUserLoggedOut(
      UserLoggedOut event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationUnAuthenticated());
    await _authRepository.logOut();
  }

  @override
  Future<void> close() {
    debugPrint("Auth Bloc close called");
    return super.close();
  }
}
