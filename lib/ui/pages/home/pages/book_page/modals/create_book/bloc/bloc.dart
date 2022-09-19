import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:untis_book_rent_app/injection.dart';
import 'package:untis_book_rent_app/ui/pages/home/pages/book_page/modals/create_book/models/email.dart';

part 'event.dart';
part 'state.dart';

@injectable
class CreateBookBloc extends Bloc<CreateBookEvent, CreateBookState> {
  CreateBookBloc() : super(const CreateBookState()) {
    on<CreateBookIsbnChanged>(_onIsbnChanged);
    on<CreateBookSubmitted>(_onSubmitted);
  }

  void _onIsbnChanged(
    CreateBookIsbnChanged event,
    Emitter<CreateBookState> emit,
  ) {
    final isbn = Isbn.dirty(event.isbn);
    emit(
      state.copyWith(
        isbn: isbn,
        status: Formz.validate([isbn]),
      ),
    );
  }

  Future<void> _onSubmitted(
    CreateBookSubmitted event,
    Emitter<CreateBookState> emit,
  ) async {
    if (state.status.isValidated) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
        //_authenticationBloc.add(UserLoggedIn(user: user));
      } catch (error) {
        debugPrint("Error for submission");
        debugPrint(error.toString());
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    }
  }
}
