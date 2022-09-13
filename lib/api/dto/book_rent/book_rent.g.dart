// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_rent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookRent _$BookRentFromJson(Map<String, dynamic> json) => BookRent(
      isbn: json['isbn'] as String?,
      status: $enumDecodeNullable(_$RentStatusEnumMap, json['status']),
      amount: json['amount'] as int?,
      classNum: json['classNum'] == null
          ? null
          : SchoolClass.fromJson(json['classNum'] as Map<String, dynamic>),
      createdBy: json['createdBy'] == null
          ? null
          : User.fromJson(json['createdBy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookRentToJson(BookRent instance) => <String, dynamic>{
      'isbn': instance.isbn,
      'status': _$RentStatusEnumMap[instance.status],
      'amount': instance.amount,
      'classNum': instance.classNum,
      'createdBy': instance.createdBy,
    };

const _$RentStatusEnumMap = {
  RentStatus.rented: 'rented',
  RentStatus.canceled: 'canceled',
  RentStatus.done: 'done',
};

CreateBookRentDto _$CreateBookRentDtoFromJson(Map<String, dynamic> json) =>
    CreateBookRentDto(
      isbn: json['isbn'] as String?,
      status: $enumDecodeNullable(_$RentStatusEnumMap, json['status']),
      amount: json['amount'] as int?,
      classNum: json['classNum'] as int?,
      createdBy: json['createdBy'] as int?,
    );

Map<String, dynamic> _$CreateBookRentDtoToJson(CreateBookRentDto instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'status': _$RentStatusEnumMap[instance.status],
      'amount': instance.amount,
      'classNum': instance.classNum,
      'createdBy': instance.createdBy,
    };

UpdateBookRentDto _$UpdateBookRentDtoFromJson(Map<String, dynamic> json) =>
    UpdateBookRentDto(
      status: $enumDecodeNullable(_$RentStatusEnumMap, json['status']),
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$UpdateBookRentDtoToJson(UpdateBookRentDto instance) =>
    <String, dynamic>{
      'status': _$RentStatusEnumMap[instance.status],
      'amount': instance.amount,
    };
