import 'package:json_annotation/json_annotation.dart';

part 'class.g.dart';

@JsonSerializable()
class SchoolClass {
  String? name;
  String? label;
  int? studentCount;

  SchoolClass({this.name, this.label, this.studentCount});

  factory SchoolClass.fromJson(Map<String, dynamic> json) =>
      _$SchoolClassFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolClassToJson(this);
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
