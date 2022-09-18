import 'package:equatable/equatable.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated()
      : this._(status: AuthenticationStatus.authenticated);

  const AuthenticationState.loggingOut()
      : this._(status: AuthenticationStatus.loggingOut);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;

  @override
  List<Object> get props => [status];
}

class AuthLoginState extends AuthenticationState {
  late final SignInUserDto signInUserDto;

  AuthLoginState({required String email, required String password})
      : super._(status: AuthenticationStatus.loggingIn) {
    signInUserDto = SignInUserDto(email: email, password: password);
  }

  @override
  List<Object> get props => [status, signInUserDto];
}

class AuthAuthenticatedState extends AuthenticationState {
  final StateUser _user;

  const AuthAuthenticatedState(this._user)
      : super._(status: AuthenticationStatus.authenticated);

  StateUser get user => _user;

  @override
  List<Object> get props => [status, _user];
}
