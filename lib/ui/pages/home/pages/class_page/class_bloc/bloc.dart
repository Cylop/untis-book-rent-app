import 'package:bloc/bloc.dart';

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/rest/services/book_service.dart';

part 'event.dart';
part 'state.dart';

const _pageSize = 20;
const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc(this._bookService) : super(const BookState()) {
    on<BookFetched>(
      _onBookFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<BookReset>(_onBookReset);
  }

  final BookService _bookService;

  Future<void> _onBookReset(
    BookReset event,
    Emitter<BookState> emit,
  ) async {
    return emit(state.copyWith(
        status: BookStatus.initial, books: [], hasReachedMax: false));
  }

  Future<void> _onBookFetched(
    BookFetched event,
    Emitter<BookState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == BookStatus.initial) {
        final posts = await _fetchPosts();
        return emit(
          state.copyWith(
            status: BookStatus.success,
            books: posts,
            hasReachedMax: false,
          ),
        );
      }
      final books = await _fetchPosts(state.books.length);
      books.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: BookStatus.success,
                books: List.of(state.books)..addAll(books),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: BookStatus.failure));
    }
  }

  Future<List<Book>> _fetchPosts([int startIndex = 0]) async {
    var page = (startIndex / _pageSize).ceil() + 1;
    debugPrint("Index: $startIndex");
    debugPrint("Page to load: $page");
    Paginated<Book> paginatedResult =
        await _bookService.getAllEntities(page: page, pageSize: _pageSize);
    debugPrint("List length ${paginatedResult.data.length}");
    debugPrint("Current page from api: ${paginatedResult.pagination?.page}");
    debugPrint(
        "Total pages from api: ${paginatedResult.pagination?.totalPages}");
    return paginatedResult.data;
  }
}
