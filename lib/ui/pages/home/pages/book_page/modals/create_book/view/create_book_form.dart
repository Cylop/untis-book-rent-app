import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/books_bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/bloc/bloc.dart';
import 'package:untis_book_rent_app/ui/pages/login/login.dart';

class CreateBookForm extends StatelessWidget {
  const CreateBookForm({super.key});

  static const mounted = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateBookBloc, CreateBookState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Error creating book')),
            );
        }
        if (state.status.isSubmissionSuccess) {
          locator<BookBloc>().add(BookReset());
          Navigator.pop(context, state.isbn.value);
        }
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Flexible(
                  child: _IsbnInput(),
                ),
                ElevatedButton(
                  key: const Key('createBookForm_scanBarCode_raisedButton'),
                  onPressed: () async {
                    var isbn = await FlutterBarcodeScanner.scanBarcode(
                        '#ff6666', 'Cancel', true, ScanMode.BARCODE);
                    if (!mounted) return;
                    context
                        .read<CreateBookBloc>()
                        .add(CreateBookIsbnChanged(isbn));
                  },
                  child: const Icon(Icons.qr_code),
                )
              ],
            ),
            const Padding(padding: EdgeInsets.all(12)),
            _CreateBookButton()
          ],
        ),
      ),
    );
  }
}

class _IsbnInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBookBloc, CreateBookState>(
      buildWhen: (previous, current) => previous.isbn != current.isbn,
      builder: (context, state) {
        return TextField(
          key: const Key('createBookForm_isbnInput_textField'),
          onChanged: (isbn) =>
              context.read<CreateBookBloc>().add(CreateBookIsbnChanged(isbn)),
          decoration: InputDecoration(
            labelText: 'Isbn',
            errorText:
                state.isbn.invalid ? 'Please provide a valid Isbn' : null,
          ),
        );
      },
    );
  }
}

class _CreateBookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateBookBloc, CreateBookState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('createBookForm_continue_raisedButton'),
                onPressed: state.status.isValidated
                    ? () {
                        context
                            .read<CreateBookBloc>()
                            .add(const CreateBookSubmitted());
                      }
                    : null,
                child: const Text('Create Book'),
              );
      },
    );
  }
}
