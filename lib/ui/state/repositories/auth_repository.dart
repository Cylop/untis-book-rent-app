import 'dart:async';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/api/rest/services/auth_service.dart';
import 'package:untis_book_rent_app/ui/state/repositories/no-user.exception.dart';

@Singleton(as: AuthRepository)
class AuthenticationRepository implements AuthRepository {
  final AuthService _authService;

  AuthenticationRepository(this._authService);

  @override
  Future<StateUser> logIn({
    required String email,
    required String password,
  }) async {
    try {
      var user = await _authService
          .login(SignInUserDto(email: email, password: password));
      return StateUser.fromUser(user);
    } catch (error) {
      debugPrint("Login error");
      debugPrint(error.toString());
    }

    return StateUser.empty;
  }

  @override
  Future<StateUser> loadCurrentUser() async {
    throw NoUserException(message: 'No user is still loggedin');
    //return Future.delayed(const Duration(milliseconds: 400), () => null);
  }

  @override
  Future<void> logOut() async {
    await _authService.logout();
  }
}

abstract class AuthRepository {
  Future<StateUser> loadCurrentUser();

  Future<StateUser> logIn({required String email, required String password});
  Future<void> logOut();
}
