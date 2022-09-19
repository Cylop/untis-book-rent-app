import 'package:dio/dio.dart';
import 'package:untis_book_rent_app/api/api_response.dart';
import 'package:untis_book_rent_app/api/dto/auth/auth.dart';
import 'package:untis_book_rent_app/api/dto/user/user.dart';
import 'package:untis_book_rent_app/api/rest/api_service.dart';

abstract class AuthService {
  Future<User> signUp(SignUpDto dto);
  Future<User> login(SignInUserDto dto);
  Future<void> logout();
}

class BasicAuthService extends AbstractApiClient<User> implements AuthService {
  BasicAuthService({required super.endpoint}) : super(create: () => User());

  @override
  Future<User> signUp(SignUpDto dto) async {
    var response = await request(
      httpMethod: HttpMethod.post,
      create: () => ApiResponse<User>(create: () => create()),
      data: dto,
      config: RequestOptions(path: "$baseUrl/signup"),
    );

    var data = response.response?.data;
    if (data == null) {
      throw ApiResponseException(message: 'Data is null');
    }
    return data;
  }

  @override
  Future<User> login(SignInUserDto dto) async {
    var response = await request(
      httpMethod: HttpMethod.post,
      create: () => ApiResponse<User>(create: () => create()),
      data: dto,
      config: RequestOptions(path: "$baseUrl/login"),
    );

    var data = response.response?.data;
    if (data == null) {
      throw ApiResponseException(message: 'Data is null');
    }
    return data;
  }

  @override
  Future<void> logout() async {
    await request(
        httpMethod: HttpMethod.post,
        create: () => ApiResponse<User>(create: () => create()),
        config: RequestOptions(path: "$baseUrl/logout"));
  }
}
