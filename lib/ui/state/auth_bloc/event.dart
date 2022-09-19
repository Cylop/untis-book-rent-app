import 'package:equatable/equatable.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppLoaded extends AuthenticationEvent {}

class UserLoggedIn extends AuthenticationEvent {
  final StateUser user;

  const UserLoggedIn({required this.user});

  @override
  List<Object> get props => [user];
}

class UserLoggedOut extends AuthenticationEvent {}
