part of 'bloc.dart';

enum ClassStatus { initial, success, failure }

class ClassState extends Equatable {
  const ClassState({
    this.status = ClassStatus.initial,
    this.classes = const <SchoolClass>[],
    this.hasReachedMax = false,
  });

  final ClassStatus status;
  final List<SchoolClass> classes;
  final bool hasReachedMax;

  ClassState copyWith({
    ClassStatus? status,
    List<SchoolClass>? classes,
    bool? hasReachedMax,
  }) {
    return ClassState(
      status: status ?? this.status,
      classes: classes ?? this.classes,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ClassState { status: $status, hasReachedMax: $hasReachedMax, classes: ${classes.length} }''';
  }

  @override
  List<Object> get props => [status, classes, hasReachedMax];
}
