import 'package:flutter/material.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/create_book_modal.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/view/create_book_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var isbn = await showModalBottomSheet<String>(
            context: context,
            builder: (BuildContext builder) {
              return const CreateBookModal();
            },
          );
          debugPrint(isbn);
        },
        label: const Icon(Icons.add),
      ),
      body: const Center(
        child: Text('Test'),
      ),
    );
  }
}
