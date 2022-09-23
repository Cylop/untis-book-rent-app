part of 'bloc.dart';

enum LoadingStatus { initial, success, failure }

class AnimatedInfiniteScrollingBlocListState<E> extends Equatable {

  final LoadingStatus status;
  final List<E> entities;
  final bool hasReachedMax;

  const AnimatedInfiniteScrollingBlocListState({ this.status = LoadingStatus.initial, this.entities = const [], this.hasReachedMax = false, });

  AnimatedInfiniteScrollingBlocListState<E> copyWith({
    LoadingStatus? status,
    List<E>? entities,
    bool? hasReachedMax,
  }) {
    return AnimatedInfiniteScrollingBlocListState(
      status: status ?? this.status,
      entities: entities ?? this.entities,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''EntityState { status: $status, hasReachedMax: $hasReachedMax, entities: ${entities.length} }''';
  }

  @override
  List<Object> get props => [status, entities, hasReachedMax];
}
