import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/dto/book_inventory/book_inventory.dart';
import 'package:untis_book_rent_app/api/dto/book_rent/book_rent.dart';
import 'package:untis_book_rent_app/api/dto/class/class.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

class BookInventoryService extends BasicService<BookInventory, int,
    CreateBookInventoryDto, UpdateBookInventoryDto, CreateBookInventoryDto> {
  BookInventoryService({required super.endpoint})
      : super(create: () => BookInventory());
}
