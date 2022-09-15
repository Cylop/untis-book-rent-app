import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

class BasicBookService
    extends BasicService<Book, int, CreateBookDto, UpdateBookDto, UpdateBookDto>
    implements BookService {
  BasicBookService({required super.endpoint}) : super(create: () => Book());
}

abstract class BookService {}
