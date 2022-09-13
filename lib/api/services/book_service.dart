import 'package:untis_book_rent_app/api/api_service.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

class BookService extends AbstractApiService<Book, int, CreateBookDto,
    UpdateBookDto, UpdateBookDto> {
  BookService({required super.endpoint}) : super(create: () => Book());
}
