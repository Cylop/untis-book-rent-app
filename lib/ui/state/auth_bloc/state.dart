import 'package:equatable/equatable.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';

enum AuthState {
  unknown,
  initial,
  loading,
  authenticated,
  unauthenticated,
  failure,
}

abstract class AuthenticationState extends Equatable {
  final AuthState status;
  const AuthenticationState({
    this.status = AuthState.unknown,
  });

  @override
  List<Object> get props => [status];
}

class AuthenticationInitial extends AuthenticationState {
  const AuthenticationInitial() : super(status: AuthState.initial);
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading() : super(status: AuthState.loading);
}

class AuthenticationUnAuthenticated extends AuthenticationState {
  const AuthenticationUnAuthenticated()
      : super(status: AuthState.unauthenticated);
}

class AuthenticationAuthenticated extends AuthenticationState {
  final StateUser user;

  const AuthenticationAuthenticated({required this.user})
      : super(status: AuthState.authenticated);

  @override
  List<Object> get props => [status, user];
}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  const AuthenticationFailure({required this.message})
      : super(status: AuthState.failure);

  @override
  List<Object> get props => [status, message];
}
