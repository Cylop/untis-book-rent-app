// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      isbn: json['isbn'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      publisher: json['publisher'] as String?,
      imageUrl: json['imageUrl'] as String?,
      publishingDate: json['publishingDate'] == null
          ? null
          : DateTime.parse(json['publishingDate'] as String),
      createdBy: json['createdBy'] == null
          ? null
          : User.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'description': instance.description,
      'publisher': instance.publisher,
      'imageUrl': instance.imageUrl,
      'publishingDate': instance.publishingDate?.toIso8601String(),
      'createdBy': instance.createdBy,
    };

CreateBookDto _$CreateBookDtoFromJson(Map<String, dynamic> json) =>
    CreateBookDto(
      isbn: json['isbn'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      publisher: json['publisher'] as String?,
      imageUrl: json['imageUrl'] as String?,
      publishingDate: json['publishingDate'] == null
          ? null
          : DateTime.parse(json['publishingDate'] as String),
      createdBy: json['createdBy'] as int?,
    );

Map<String, dynamic> _$CreateBookDtoToJson(CreateBookDto instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'title': instance.title,
      'description': instance.description,
      'publisher': instance.publisher,
      'imageUrl': instance.imageUrl,
      'publishingDate': instance.publishingDate?.toIso8601String(),
      'createdBy': instance.createdBy,
    };

UpdateBookDto _$UpdateBookDtoFromJson(Map<String, dynamic> json) =>
    UpdateBookDto(
      title: json['title'] as String?,
      description: json['description'] as String?,
      publisher: json['publisher'] as String?,
      imageUrl: json['imageUrl'] as String?,
      publishingDate: json['publishingDate'] == null
          ? null
          : DateTime.parse(json['publishingDate'] as String),
    );

Map<String, dynamic> _$UpdateBookDtoToJson(UpdateBookDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'publisher': instance.publisher,
      'imageUrl': instance.imageUrl,
      'publishingDate': instance.publishingDate?.toIso8601String(),
    };
