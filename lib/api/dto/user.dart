import 'package:untis_book_rent_app/api/generic.dart';

class User implements Decodeable<User> {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  @override
  User decode(data) {
    return User(
      id: data?['id'] ?? '',
      name: data?['name'] ?? '',
      email: data?['email'] ?? '',
    );
  }
}

class CreateUserDto {
  final String name;
  final String email;
  final String password;
  const CreateUserDto(
      {required this.name, required this.email, required this.password});
}

class UpdateUserDto {
  String? name;
  String? email;
  String? password;
  UpdateUserDto({this.name, this.email, this.password});
}

class SignInUserDto {
  final String email;
  final String password;
  const SignInUserDto({required this.email, required this.password});
}
