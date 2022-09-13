import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:untis_book_rent_app/api/generic.dart';

part 'class.g.dart';

@JsonSerializable()
class SchoolClass extends Equatable implements Decodeable<SchoolClass> {
  String? name;
  String? label;
  int? studentCount;

  SchoolClass({this.name, this.label, this.studentCount});

  factory SchoolClass.fromJson(Map<String, dynamic> json) =>
      _$SchoolClassFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolClassToJson(this);

  @override
  SchoolClass decode(data) => SchoolClass.fromJson(data);

  @override
  List<Object?> get props => [name, label, studentCount];
}

@JsonSerializable()
class CreateSchoolClassDto {
  String? name;
  String? label;
  int? studentCount;

  CreateSchoolClassDto({this.name, this.label, this.studentCount});

  factory CreateSchoolClassDto.fromJson(Map<String, dynamic> json) =>
      _$CreateSchoolClassDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateSchoolClassDtoToJson(this);
}

@JsonSerializable()
class UpdateSchoolClassDto {
  String? label;
  int? studentCount;

  UpdateSchoolClassDto({this.label, this.studentCount});

  factory UpdateSchoolClassDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateSchoolClassDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateSchoolClassDtoToJson(this);
}
