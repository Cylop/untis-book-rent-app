import 'package:equatable/equatable.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/ui/state/repositories/auth_repository.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = StateUser.empty,
  });

  const AuthenticationState.unknown() : this._();

  const AuthenticationState.authenticated(StateUser user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final StateUser user;

  @override
  List<Object> get props => [status, user];
}
