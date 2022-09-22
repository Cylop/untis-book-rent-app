part of 'bloc.dart';

abstract class ClassEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ClassFetched extends ClassEvent {}

class ClassReset extends ClassEvent {}
