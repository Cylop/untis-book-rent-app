import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/api/rest/services/auth_service.dart';

enum AuthenticationStatus {
  unknown,
  loggingIn,
  authenticated,
  loggingOut,
  unauthenticated
}

@Singleton(as: IAuthenticationRepository)
class AuthenticationRepository implements IAuthenticationRepository {
  final AuthService _authService;
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationRepository(this._authService);

  @override
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<StateUser> logIn({
    required String email,
    required String password,
  }) async {
    _controller.add(AuthenticationStatus.loggingIn);
    try {
      var user = await _authService
          .login(SignInUserDto(email: email, password: password));
      _controller.add(AuthenticationStatus.authenticated);
      return StateUser.fromUser(user);
    } catch (error) {
      debugPrint("Login error");
      debugPrint(error.toString());
      _controller.add(AuthenticationStatus.unauthenticated);
    }

    return StateUser.empty;
  }

  @override
  Future<void> logOut() {
    _controller.add(AuthenticationStatus.unauthenticated);
    return _authService.logout();
  }

  @override
  void dispose() => _controller.close();
}

abstract class IAuthenticationRepository {
  Stream<AuthenticationStatus> get status;

  Future<StateUser> logIn({required String email, required String password});
  Future<void> logOut();

  void dispose();
}
