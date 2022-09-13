import 'package:dio/dio.dart';
import 'package:untis_book_rent_app/api/api_response.dart';
import 'package:untis_book_rent_app/api/generic.dart';

abstract class BaseApiClient {
  Future<ResponseWrapper<T>> request<T extends Decodeable>({
    required HttpMethod httpMethod,
    required Create<T> create,
    dynamic data,
  });
}

abstract class AbstractApiService<
    ResultDto extends Decodeable,
    Id,
    CreateDto,
    UpdateDto,
    DeleteDto> extends GenericObject<ResultDto> implements BaseApiClient {
  Dio dio = Dio();

  String baseUrl = 'http://localhost:3000/api/v1/';
  final String endpoint;

  AbstractApiService(
      {String? baseUrl,
      required this.endpoint,
      required Create<Decodeable> create})
      : super(create: create) {
    if (baseUrl != null) this.baseUrl = baseUrl;
  }

  Future<List<ResultDto>> getAllEntities() async {
    var response = await request(
        httpMethod: HttpMethod.get,
        create: () => ApiListResponse<ResultDto>(create: () => create()));

    final results = response.response?.data ?? [];
    return results;
  }

  Future<ResultDto> getEntityById(Id id) async {
    var response = await request(
      httpMethod: HttpMethod.get,
      create: () => ApiResponse<ResultDto>(create: () => create()),
      config: RequestOptions(path: getUrl() + "/" + id),
    );

    final user = response.response?.data;
    if (user == null) {
      throw ApiResponseException(message: "Entity with id $id doesn't exist");
    }
    return user;
  }

  Future<ResultDto> createEntity(CreateDto? value) async {
    var response = await request(
      httpMethod: HttpMethod.post,
      create: () => ApiResponse<ResultDto>(create: () => create()),
      data: value,
    );

    final user = response.response!.data;
    return user;
  }

  Future<ResultDto> deleteEntity(Id id, CreateDto? value) async {
    var response = await request(
      httpMethod: HttpMethod.delete,
      create: () => ApiResponse<ResultDto>(create: () => create()),
      config: RequestOptions(path: getUrl() + "/" + id),
    );

    final user = response.response!.data;
    return user;
  }

  Future<ResultDto> updateEntity(Id id, UpdateDto value) async {
    var response = await request(
      httpMethod: HttpMethod.put,
      create: () => ApiResponse<ResultDto>(create: () => create()),
      config: RequestOptions(path: getUrl() + "/" + id),
    );

    final user = response.response!.data;
    return user;
  }

  getUrl() => baseUrl + endpoint;

  @override
  Future<ResponseWrapper<T>> request<T extends Decodeable>({
    required HttpMethod httpMethod,
    required Create<T> create,
    dynamic data,
    RequestOptions? config,
  }) async {
    config ??= RequestOptions(path: baseUrl + endpoint);
    if (data != null) {
      if (httpMethod == HttpMethod.get) {
        config.queryParameters = data;
      } else {
        config.data = data;
      }
    }
    try {
      final response = await dio.fetch(config);
      return ResponseWrapper.init(create: create, data: response.data);
    } on DioError catch (err) {
      throw ApiResponseException(message: err.message);
    }
  }
}

enum HttpMethod {
  get(method: 'GET'),
  post(method: 'POST'),
  put(method: 'PUT'),
  patch(method: 'PATCH'),
  header(method: 'HEADER'),
  delete(method: 'DELETE');

  final String method;

  const HttpMethod({required this.method});
}
