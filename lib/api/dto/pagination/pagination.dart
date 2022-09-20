import 'package:json_annotation/json_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable()
class Pagination {
  int? count;
  int? pageSize;
  int? page;
  int? prevPage;
  int? nextPage;
  int? totalPages;

  Pagination(
      {this.count,
      this.pageSize,
      this.page,
      this.prevPage,
      this.nextPage,
      this.totalPages});

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
  Map<String, dynamic> toJson() => _$PaginationToJson(this);
}
