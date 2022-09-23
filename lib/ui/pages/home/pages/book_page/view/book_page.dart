import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/create_book_modal.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/view/book_list.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
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
        },
        mini: true,
        child: const Icon(Icons.add),
        //icon: const Icon(Icons.add), label: const Text('Create Book'),
        //label: ,
      ),
      body: const BookList(),
    );
  }
}
