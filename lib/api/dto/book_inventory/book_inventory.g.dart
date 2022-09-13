// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_inventory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookInventory _$BookInventoryFromJson(Map<String, dynamic> json) =>
    BookInventory(
      isbn: json['isbn'] as String?,
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$BookInventoryToJson(BookInventory instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'amount': instance.amount,
    };

CreateBookInventoryDto _$CreateBookInventoryDtoFromJson(
        Map<String, dynamic> json) =>
    CreateBookInventoryDto(
      isbn: json['isbn'] as String?,
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$CreateBookInventoryDtoToJson(
        CreateBookInventoryDto instance) =>
    <String, dynamic>{
      'isbn': instance.isbn,
      'amount': instance.amount,
    };

UpdateBookInventoryDto _$UpdateBookInventoryDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateBookInventoryDto(
      amount: json['amount'] as int?,
    );

Map<String, dynamic> _$UpdateBookInventoryDtoToJson(
        UpdateBookInventoryDto instance) =>
    <String, dynamic>{
      'amount': instance.amount,
    };
