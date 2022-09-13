import 'package:untis_book_rent_app/api/generic.dart';

class ResponseWrapper<T> extends GenericObject<T> {
  T? response;

  ResponseWrapper({required Create<Decodeable> create}) : super(create: create);

  factory ResponseWrapper.init(
      {required Create<Decodeable> create, required dynamic data}) {
    final wrapper = ResponseWrapper<T>(create: create);
    wrapper.response = wrapper.genericObject(data);
    return wrapper;
  }
}

abstract class AbstractApiResponse<T> extends GenericObject<T>
    implements Decodeable<AbstractApiResponse<T>> {
  String path = "";
  String status = "ERROR";

  AbstractApiResponse({required Create<Decodeable> create})
      : super(create: create);

  @override
  AbstractApiResponse<T> decode(dynamic json) {
    path = json['path'];
    status = json['status'];
    return this;
  }
}

class ApiResponse<T> extends AbstractApiResponse<T> {
  ApiResponse({required Create<Decodeable> create}) : super(create: create);

  late T data;

  @override
  ApiResponse<T> decode(dynamic json) {
    super.decode(json);
    data = genericObject(json['data']);
    return this;
  }
}

class ApiListResponse<T> extends AbstractApiResponse<T>
    implements Decodeable<AbstractApiResponse<T>> {
  ApiListResponse({required Create<Decodeable> create}) : super(create: create);

  late List<T> data;

  @override
  ApiListResponse<T> decode(dynamic json) {
    super.decode(json);
    data = [];
    json['data'].forEach((item) {
      data.add(genericObject(item));
    });

    return this;
  }
}

class ApiResponseException implements Exception {
  String? message;

  ApiResponseException({this.message});

  factory ApiResponseException.fromJson(Map<String, dynamic> json) {
    return ApiResponseException(
        message: json['message'] ?? 'Something went wrong.');
  }

  @override
  String toString() {
    return message ?? 'Failed to convert message to string.';
  }
}
