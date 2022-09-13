import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/api/generic.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable implements Decodeable<Book> {
  String? isbn;
  String? title;
  String? description;
  String? publisher;
  String? imageUrl;
  DateTime? publishingDate;
  User? createdBy;

  Book({
    this.isbn,
    this.title,
    this.description,
    this.publisher,
    this.imageUrl,
    this.publishingDate,
    this.createdBy,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object?> get props => [
        isbn,
        title,
        description,
        publisher,
        imageUrl,
        publishingDate,
        createdBy,
      ];

  @override
  Book decode(data) => Book.fromJson(data);
}

@JsonSerializable()
class CreateBookDto {
  String? isbn;
  String? title;
  String? description;
  String? publisher;
  String? imageUrl;
  DateTime? publishingDate;
  int? createdBy;

  CreateBookDto({
    this.isbn,
    this.title,
    this.description,
    this.publisher,
    this.imageUrl,
    this.publishingDate,
    this.createdBy,
  });

  factory CreateBookDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBookDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBookDtoToJson(this);
}

@JsonSerializable()
class UpdateBookDto {
  String? title;
  String? description;
  String? publisher;
  String? imageUrl;
  DateTime? publishingDate;

  UpdateBookDto({
    this.title,
    this.description,
    this.publisher,
    this.imageUrl,
    this.publishingDate,
  });

  factory UpdateBookDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateBookDtoToJson(this);
}
