import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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

class AnimatedInfiniteScrollingBloc<E> extends Bloc<
    AnimatedInfiniteScrollingBlocListEvent,
    AnimatedInfiniteScrollingBlocListState<E>> {
  AnimatedInfiniteScrollingBloc(this._entityService, {this.pageSize = 25})
      : super(AnimatedInfiniteScrollingBlocListState<E>()) {
    on<EntitiesFetched>(
      _onEntitiesFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<EntitiesReset>(_onEntitiesReset);
    debugPrint('AnimatedBloc loaded');
  }

  final int pageSize;
  final AbstractService<E, dynamic, dynamic, dynamic, dynamic> _entityService;

  Future<void> _onEntitiesReset(
    EntitiesReset event,
    Emitter<AnimatedInfiniteScrollingBlocListState<E>> emit,
  ) async {
    return emit(state.copyWith(
      status: LoadingStatus.initial,
      entities: [],
      hasReachedMax: false,
    ));
  }

  Future<void> _onEntitiesFetched(
    EntitiesFetched event,
    Emitter<AnimatedInfiniteScrollingBlocListState<E>> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == LoadingStatus.initial) {
        final entities = await _fetchEntities();
        return emit(
          state.copyWith(
            status: LoadingStatus.success,
            entities: entities as List<E>,
            hasReachedMax: entities.length < pageSize,
          ),
        );
      }
      final List<E> entities = await _fetchEntities(state.entities.length);
      entities.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: LoadingStatus.success,
                entities: (List.of(state.entities)
                  ..addAll(entities as List<E>)),
                hasReachedMax: false,
              ),
            );
    } catch (error) {
      debugPrint(error.toString());
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  Future<List<E>> _fetchEntities([int startIndex = 0]) async {
    var page = (startIndex / pageSize).ceil() + 1;
    debugPrint('fetch called');
    Paginated<E> paginatedResult =
        await _entityService.getAllEntities(page: page, pageSize: pageSize);
    debugPrint(paginatedResult.data.toString());
    return paginatedResult.data;
  }
}
