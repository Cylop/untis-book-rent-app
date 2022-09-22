import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/dto/class/class.dart';

class BasicClassService extends BasicService<
    SchoolClass,
    int,
    CreateSchoolClassDto,
    UpdateSchoolClassDto,
    CreateSchoolClassDto> implements ClassService {
  BasicClassService({required super.endpoint})
      : super(create: () => SchoolClass());
}

abstract class ClassService implements BasicService<SchoolClass, int, CreateSchoolClassDto, UpdateSchoolClassDto, CreateSchoolClassDto> {}
