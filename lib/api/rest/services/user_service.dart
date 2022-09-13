import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

class UserService extends BasicService<User, int, CreateUserDto, UpdateUserDto,
    CreateUserDto> {
  UserService({required super.endpoint}) : super(create: () => User());
}
