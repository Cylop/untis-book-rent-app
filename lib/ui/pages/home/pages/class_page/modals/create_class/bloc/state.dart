part of 'bloc.dart';

class CreateBookState extends Equatable {
  const CreateBookState({
    this.status = FormzStatus.pure,
    this.isbn = const Isbn.pure(),
  });

  final FormzStatus status;
  final Isbn isbn;

  CreateBookState copyWith({
    FormzStatus? status,
    Isbn? isbn,
  }) {
    return CreateBookState(
      status: status ?? this.status,
      isbn: isbn ?? this.isbn,
    );
  }

  @override
  List<Object> get props => [status, isbn];
}
