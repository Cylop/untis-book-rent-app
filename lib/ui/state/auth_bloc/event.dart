import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  AuthenticationStatusChanged(this.status) {
    debugPrint('Status changed to ${status.name}');
  }

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthenticationLoginRequest extends AuthenticationEvent {
  final String email;
  final String password;

  const AuthenticationLoginRequest({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class AuthenticationLogoutRequested extends AuthenticationEvent {}
