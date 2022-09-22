import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/view/create_book_form.dart';

class CreateBookModal extends StatelessWidget {
  const CreateBookModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<CreateBookBloc>(),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: CreateBookForm(),
      ),
    );
  }
}
