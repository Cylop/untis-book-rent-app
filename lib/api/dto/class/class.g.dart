// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolClass _$SchoolClassFromJson(Map<String, dynamic> json) => SchoolClass(
      name: json['name'] as String?,
      label: json['label'] as String?,
      studentCount: json['studentCount'] as int?,
    );

Map<String, dynamic> _$SchoolClassToJson(SchoolClass instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'studentCount': instance.studentCount,
    };

CreateSchoolClassDto _$CreateSchoolClassDtoFromJson(
        Map<String, dynamic> json) =>
    CreateSchoolClassDto(
      name: json['name'] as String?,
      label: json['label'] as String?,
      studentCount: json['studentCount'] as int?,
    );

Map<String, dynamic> _$CreateSchoolClassDtoToJson(
        CreateSchoolClassDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'label': instance.label,
      'studentCount': instance.studentCount,
    };

UpdateSchoolClassDto _$UpdateSchoolClassDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateSchoolClassDto(
      label: json['label'] as String?,
      studentCount: json['studentCount'] as int?,
    );

Map<String, dynamic> _$UpdateSchoolClassDtoToJson(
        UpdateSchoolClassDto instance) =>
    <String, dynamic>{
      'label': instance.label,
      'studentCount': instance.studentCount,
    };
