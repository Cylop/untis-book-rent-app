// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      id: json['id'] as String?,
      isbn10: json['isbn10'] as String?,
      isbn13: json['isbn13'] as String?,
      title: json['title'] as String?,
      titleLong: json['titleLong'] as String?,
      imageUrl: json['imageUrl'] as String?,
      publisher: json['publisher'] as String?,
      publishingDate: json['publishingDate'] == null
          ? null
          : DateTime.parse(json['publishingDate'] as String),
      pages: json['pages'] as int?,
      binding: json['binding'] as String?,
      authors:
          (json['authors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      amount: json['amount'] as int?,
      createdBy: json['createdBy'] == null
          ? null
          : User.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'isbn10': instance.isbn10,
      'isbn13': instance.isbn13,
      'title': instance.title,
      'titleLong': instance.titleLong,
      'imageUrl': instance.imageUrl,
      'publisher': instance.publisher,
      'publishingDate': instance.publishingDate?.toIso8601String(),
      'pages': instance.pages,
      'binding': instance.binding,
      'authors': instance.authors,
      'amount': instance.amount,
      'createdBy': instance.createdBy,
    };

CreateBookDto _$CreateBookDtoFromJson(Map<String, dynamic> json) =>
    CreateBookDto(
      isbn: json['isbn'] as String?,
      createdBy: json['createdBy'] as int?,
    );

Map<String, dynamic> _$CreateBookDtoToJson(CreateBookDto instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
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
