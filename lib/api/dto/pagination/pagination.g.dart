// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      count: json['count'] as int?,
      pageSize: json['pageSize'] as int?,
      page: json['page'] as int?,
      prevPage: json['prevPage'] as int?,
      nextPage: json['nextPage'] as int?,
      totalPages: json['totalPages'] as int?,
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pageSize': instance.pageSize,
      'page': instance.page,
      'prevPage': instance.prevPage,
      'nextPage': instance.nextPage,
      'totalPages': instance.totalPages,
    };
