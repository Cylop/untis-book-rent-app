part of 'bloc.dart';

abstract class BookEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class BookFetched extends BookEvent {}

class BookReset extends BookEvent {}
