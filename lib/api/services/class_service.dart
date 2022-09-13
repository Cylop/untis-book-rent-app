import 'package:untis_book_rent_app/api/api_service.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/dto/class/class.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

class ClassService extends AbstractApiService<SchoolClass, int,
    CreateSchoolClassDto, UpdateSchoolClassDto, CreateSchoolClassDto> {
  ClassService({required super.endpoint}) : super(create: () => SchoolClass());
}
