import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

class BasicUserService
    extends BasicService<User, int, CreateUserDto, UpdateUserDto, CreateUserDto>
    implements UserService {
  BasicUserService({required super.endpoint}) : super(create: () => User());
}

abstract class UserService {}
