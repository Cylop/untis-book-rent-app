import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/rest/services/book_service.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/create_book_modal.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/view/create_book_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/widgets/book_list_tile.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  late List<Book> books = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fetchBooks();
  }

  _fetchBooks() async {
    var bookService = locator<BookService>();
    var bookResponse = await bookService.getAllEntities();
    books = bookResponse;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showModalBottomSheet<String>(
            context: context,
            builder: (BuildContext builder) {
              return const CreateBookModal();
            },
          );
          books = [];
          await _fetchBooks();
        },
        mini: true,
        child: const Icon(Icons.add),
        //icon: const Icon(Icons.add), label: const Text('Create Book'),
        //label: ,
      ),
      body: Center(
        child: books!.isEmpty
            ? const CircularProgressIndicator()
            : ListView.separated(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return BookListTile(book: books[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 10,
                ),
              ),
      ),
    );
  }
}
