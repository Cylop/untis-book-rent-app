part of 'bloc.dart';

abstract class CreateBookEvent extends Equatable {
  const CreateBookEvent();

  @override
  List<Object> get props => [];
}

class CreateBookIsbnChanged extends CreateBookEvent {
  const CreateBookIsbnChanged(this.isbn);

  final String isbn;

  @override
  List<Object> get props => [isbn];
}

class CreateBookSubmitted extends CreateBookEvent {
  const CreateBookSubmitted();
}
