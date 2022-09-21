import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';

class BasicBookService extends BasicService<Book, String, CreateBookDto,
    UpdateBookDto, UpdateBookDto> implements BookService {
  BasicBookService({required super.endpoint}) : super(create: () => Book());
}

abstract class BookService
    implements
        AbstractService<Book, String, CreateBookDto, UpdateBookDto,
            UpdateBookDto> {}
