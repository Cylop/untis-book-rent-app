import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/api/generic.dart';

part 'book.g.dart';

@JsonSerializable()
class Book extends Equatable implements Decodeable<Book> {
  String? id;
  String? isbn10;
  String? isbn13;
  String? title;
  String? titleLong;
  String? imageUrl;
  String? publisher;
  DateTime? publishingDate;
  int? pages;
  String? binding;
  List<String>? authors;
  int? amount;
  User? createdBy;

  Book({
    this.id,
    this.isbn10,
    this.isbn13,
    this.title,
    this.titleLong,
    this.imageUrl,
    this.publisher,
    this.publishingDate,
    this.pages,
    this.binding,
    this.authors,
    this.amount,
    this.createdBy,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  List<Object?> get props => [
        id,
        isbn10,
        isbn13,
        title,
        titleLong,
        imageUrl,
        publisher,
        publishingDate,
        publishingDate,
        pages,
        binding,
        authors,
        amount,
        createdBy,
      ];

  @override
  Book decode(data) => Book.fromJson(data);
}

@JsonSerializable()
class CreateBookDto {
  String? isbn;
  int? createdBy;

  CreateBookDto({
    this.isbn,
    this.createdBy,
  });

  factory CreateBookDto.fromJson(Map<String, dynamic> json) =>
      _$CreateBookDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateBookDtoToJson(this);
}

@Deprecated('Currently not used because books cant be updated manually')
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
