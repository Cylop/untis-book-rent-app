import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

@Singleton(as: IUserRepository)
class UserRepository implements IUserRepository {
  StateUser? _user;

  @override
  Future<StateUser?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = const StateUser(1, 'Fritz', 'fritz@gmail.com'),
    );
  }
}

abstract class IUserRepository {
  Future<StateUser?> getUser();
}
