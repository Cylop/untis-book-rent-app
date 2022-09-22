import 'package:bloc/bloc.dart';

import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:untis_book_rent_app/api/dto/book/book.dart';
import 'package:untis_book_rent_app/api/dto/class/class.dart';
import 'package:untis_book_rent_app/api/rest/api_service.dart';
import 'package:untis_book_rent_app/api/rest/services/book_service.dart';
import 'package:untis_book_rent_app/api/rest/services/class_service.dart';

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
class ClassBloc extends Bloc<ClassEvent, ClassState> {
  ClassBloc(this._classService) : super(const ClassState()) {
    on<ClassFetched>(
      _onClassFetched,
      transformer: throttleDroppable(throttleDuration),
    );
    on<ClassReset>(_onClassReset);
  }

  final ClassService _classService;

  Future<void> _onClassReset(
    ClassReset event,
    Emitter<ClassState> emit,
  ) async {
    return emit(state.copyWith(
        status: ClassStatus.initial, classes: [], hasReachedMax: false));
  }

  Future<void> _onClassFetched(
      ClassFetched event,
    Emitter<ClassState> emit,
  ) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == ClassStatus.initial) {
        final classes = await _fetchClasses();
        return emit(
          state.copyWith(
            status: ClassStatus.success,
            classes: classes,
            hasReachedMax: classes.length < _pageSize,
          ),
        );
      }
      final classes = await _fetchClasses(state.classes.length);
      classes.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(
              state.copyWith(
                status: ClassStatus.success,
                classes: List.of(state.classes)..addAll(classes),
                hasReachedMax: false,
              ),
            );
    } catch (_) {
      emit(state.copyWith(status: ClassStatus.failure));
    }
  }

  Future<List<SchoolClass>> _fetchClasses([int startIndex = 0]) async {
    var page = (startIndex / _pageSize).ceil() + 1;
    Paginated<SchoolClass> paginatedResult =
        await _classService.getAllEntities(page: page, pageSize: _pageSize);
    return paginatedResult.data;
  }
}
