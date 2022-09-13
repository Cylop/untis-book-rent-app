import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class SignUpDto {
  String? name;
  String? email;
  String? password;

  SignUpDto({
    this.name,
    this.email,
    this.password,
  });

  factory SignUpDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpDtoFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpDtoToJson(this);
}

@JsonSerializable()
class LoginDto {
  String? email;
  String? password;

  LoginDto({
    this.email,
    this.password,
  });

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
}
