part of 'bloc.dart';

abstract class AnimatedInfiniteScrollingBlocListEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class EntitiesFetched extends AnimatedInfiniteScrollingBlocListEvent {}

class EntitiesReset extends AnimatedInfiniteScrollingBlocListEvent {}
