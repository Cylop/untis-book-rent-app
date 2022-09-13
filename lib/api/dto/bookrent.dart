import 'package:untis_book_rent_app/api/dto/schoolclass.dart';
import 'package:untis_book_rent_app/api/dto/user.dart';

class BookRent {
  final String isbn;
  final RentStatus status;
  final int amount;
  final SchoolClass classNum;
  final User createdBy;

  const BookRent(
      {required this.isbn,
      required this.status,
      required this.amount,
      required this.classNum,
      required this.createdBy});

  factory BookRent.fromJson(Map<String, dynamic> json) {
    return BookRent(
      isbn: json['isbn'],
      status: json['status'],
      amount: json['amount'],
      classNum: SchoolClass.fromJson(json['status']),
      createdBy: User.fromJson(json['createdBy']),
    );
  }
}

enum RentStatus { rented, canceled, done }
