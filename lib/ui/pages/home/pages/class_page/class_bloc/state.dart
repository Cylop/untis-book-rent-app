part of 'bloc.dart';

enum BookStatus { initial, success, failure }

class BookState extends Equatable {
  const BookState({
    this.status = BookStatus.initial,
    this.books = const <Book>[],
    this.hasReachedMax = false,
  });

  final BookStatus status;
  final List<Book> books;
  final bool hasReachedMax;

  BookState copyWith({
    BookStatus? status,
    List<Book>? books,
    bool? hasReachedMax,
  }) {
    return BookState(
      status: status ?? this.status,
      books: books ?? this.books,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''BookState { status: $status, hasReachedMax: $hasReachedMax, posts: ${books.length} }''';
  }

  @override
  List<Object> get props => [status, books, hasReachedMax];
}
