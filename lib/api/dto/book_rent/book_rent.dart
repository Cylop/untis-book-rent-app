import 'package:json_annotation/json_annotation.dart';
import 'package:untis_book_rent_app/api/dto/class/class.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';

part 'book_rent.g.dart';

@JsonSerializable()
class BookRent {
  String? isbn;
  RentStatus? status;
  int? amount;
  SchoolClass? classNum;
  User? createdBy;

  BookRent({
    this.isbn,
    this.status,
    this.amount,
    this.classNum,
    this.createdBy,
  });

  factory BookRent.fromJson(Map<String, dynamic> json) =>
      _$BookRentFromJson(json);
  Map<String, dynamic> toJson() => _$BookRentToJson(this);
}

enum RentStatus { rented, canceled, done }

@JsonSerializable()
class CreateBookRentDto {
  String? isbn;
  RentStatus? status;
  int? amount;
  int? classNum;
  int? createdBy;

  CreateBookRentDto({
    this.isbn,
    this.status,
    this.amount,
    this.classNum,
    this.createdBy,
  });

  factory CreateBookRentDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBookRentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBookRentDtoToJson(this);
}

@JsonSerializable()
class UpdateBookRentDto {
  RentStatus? status;
  int? amount;

  UpdateBookRentDto({
    this.status,
    this.amount,
  });

  factory UpdateBookRentDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookRentDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateBookRentDtoToJson(this);
}
