import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/widgets/book_list_tile.dart';
import 'package:untis_book_rent_app/ui/pages/home/widgets/animated_infinite_scrolling_list/animated_infinite_scrolling_list.dart';

class BookList extends StatelessWidget {
  const BookList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedInfiniteScrollingBlocList<Book>(
      entityName: 'Books',
      bloc: locator(instanceName: 'animatedBookList'),
      builder: (context, entity) => BookListTile(book: entity),
    );
  }
}
