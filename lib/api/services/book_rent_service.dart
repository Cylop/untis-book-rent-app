import 'package:untis_book_rent_app/api/api_service.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/dto/book_rent/book_rent.dart';
import 'package:untis_book_rent_app/api/dto/class/class.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

class BookRentService extends AbstractApiService<BookRent, int,
    CreateBookRentDto, UpdateBookRentDto, CreateBookRentDto> {
  BookRentService({required super.endpoint}) : super(create: () => BookRent());
}
