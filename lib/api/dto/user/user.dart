import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:untis_book_rent_app/api/generic.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable implements Decodeable<User> {
  int? id;
  String? name;
  String? email;

  User({this.id, this.name, this.email});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  User decode(data) {
    return User.fromJson(data);
  }

  @override
  List<Object?> get props => [id, name, email];
}

@JsonSerializable()
class CreateUserDto {
  final String name;
  final String email;
  final String password;
  const CreateUserDto(
      {required this.name, required this.email, required this.password});

  factory CreateUserDto.fromJson(Map<String, dynamic> json) =>
      _$CreateUserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserDtoToJson(this);
}

@JsonSerializable()
class UpdateUserDto {
  String? name;
  String? email;
  String? password;
  UpdateUserDto({this.name, this.email, this.password});

  factory UpdateUserDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserDtoToJson(this);
}

@JsonSerializable()
class SignInUserDto {
  final String email;
  final String password;
  const SignInUserDto({required this.email, required this.password});

  factory SignInUserDto.fromJson(Map<String, dynamic> json) =>
      _$SignInUserDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignInUserDtoToJson(this);
}
