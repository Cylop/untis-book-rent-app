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
  late T data;

  AbstractApiResponse({required Create<Decodeable> create})
      : super(create: create);

  @override
  AbstractApiResponse<T> decode(dynamic json) {
    path = json['path'];
    status = json['status'];
    data = decodeData(json);
    return this;
  }

  T decodeData(dynamic json);
}

class ApiResponse<T> extends AbstractApiResponse<T> {
  ApiResponse({required Create<Decodeable> create}) : super(create: create);

  @override
  T decodeData(dynamic json) {
    return genericObject(json['data']);
  }
}

class ApiListResponse<T extends List> extends AbstractApiResponse<T> {
  ApiListResponse({required Create<Decodeable> create}) : super(create: create);

  @override
  T decodeData(json) {
    var data = [];
    json['data'].forEach((item) {
      data?.add(genericObject(item));
    });

    return data as T;
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
