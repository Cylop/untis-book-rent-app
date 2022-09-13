import 'package:untis_book_rent_app/api/apiservice.dart';
import 'package:untis_book_rent_app/api/dto/user.dart';

class UserService extends AbstractApiService<User> {
  UserService({required super.endpoint});

  @override
  Future<User> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
