import 'package:untis_book_rent_app/api/dto/user.dart';

class Book {
  final String isbn;
  final String title;
  final String description;
  final String publisher;
  final String imageUrl;
  final DateTime publishingDate;
  final User createdBy;

  const Book(
      {required this.isbn,
      required this.title,
      this.description = "",
      required this.publisher,
      this.imageUrl = "",
      required this.publishingDate,
      required this.createdBy});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      isbn: json['isbn'],
      title: json['title'],
      description: json['description'],
      publisher: json['publisher'],
      imageUrl: json['imageUrl'],
      publishingDate: json['publishingDate'],
      createdBy: User.fromJson(json['createdBy']),
    );
  }
}
