import 'package:bloc/bloc.dart';

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:untis_book_rent_app/api/rest/api_service.dart';

part 'event.dart';
part 'state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

abstract class AnimatedInfiniteScrollingBloc<E> extends Bloc<AnimatedInfiniteScrollingBlocListEvent, AnimatedInfiniteScrollingBlocListState<E>> {
  AnimatedInfiniteScrollingBloc(this._entityService, {this.pageSize = 25}) : super(const AnimatedInfiniteScrollingBlocListState()) {
    on<EntitiesFetched>(
      _onEntitiesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<EntitiesReset>(_onEntitiesReset);
  }

  final int pageSize;
  final AbstractService<E, dynamic, dynamic, dynamic, dynamic> _entityService;

  Future<void> _onEntitiesReset(
      EntitiesReset event,
    Emitter<AnimatedInfiniteScrollingBlocListState> emit,
  ) async {
    return emit(state.copyWith(
        status: LoadingStatus.initial, entities: [], hasReachedMax: false));
  }

  Future<void> _onEntitiesFetched(
      EntitiesFetched event,
    Emitter<AnimatedInfiniteScrollingBlocListState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == LoadingStatus.initial) {
        final entities = await _fetchEntities();
        return emit(
          state.copyWith(
            status: LoadingStatus.success,
            entities: entities,
            hasReachedMax: entities.length < pageSize,
          ),
        );
      }
      final entities = await _fetchEntities(state.entities.length);
      entities.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: LoadingStatus.success,
                entities: List.of(state.entities)..addAll(entities),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  Future<List<E>> _fetchEntities([int startIndex = 0]) async {
    var page = (startIndex / pageSize).ceil() + 1;
    Paginated<E> paginatedResult =
        await _entityService.getAllEntities(page: page, pageSize: pageSize);
    return paginatedResult.data;
  }
}
