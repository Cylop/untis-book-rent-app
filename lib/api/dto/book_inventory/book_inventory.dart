import 'package:json_annotation/json_annotation.dart';

part 'book_inventory.g.dart';

@JsonSerializable()
class BookInventory {
  String? isbn;
  int? amount;

  BookInventory({this.isbn, this.amount});

  factory BookInventory.fromJson(Map<String, dynamic> json) =>
      _$BookInventoryFromJson(json);
  Map<String, dynamic> toJson() => _$BookInventoryToJson(this);
}

@JsonSerializable()
class CreateBookInventoryDto {
  String? isbn;
  int? amount;

  CreateBookInventoryDto({this.isbn, this.amount});

  factory CreateBookInventoryDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBookInventoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBookInventoryDtoToJson(this);
}

@JsonSerializable()
class UpdateBookInventoryDto {
  int? amount;

  UpdateBookInventoryDto({this.amount});

  factory UpdateBookInventoryDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookInventoryDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateBookInventoryDtoToJson(this);
}
