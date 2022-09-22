import 'package:dio/dio.dart';
import 'package:untis_book_rent_app/api/api_response.dart';
import 'package:untis_book_rent_app/api/dto/pagination/pagination.dart';
import 'package:untis_book_rent_app/api/generic.dart';

abstract class BaseApiClient {
  Future<ResponseWrapper<T>> request<T extends Decodeable>({
    required HttpMethod httpMethod,
    required Create<T> create,
    dynamic data,
  });
}

abstract class AbstractApiClient<ResultDto extends Decodeable>
    extends GenericObject<ResultDto> implements BaseApiClient {
  Dio dio = Dio();

  String baseUrl = 'http://10.0.2.2:3000';
  String apiSegment = '/api/v1/';
  final String endpoint;

  AbstractApiClient(
      {String? baseUrl,
      required this.endpoint,
      required Create<Decodeable> create})
      : super(create: create) {
    if (baseUrl != null) this.baseUrl = baseUrl;
  }

  getUrl() => baseUrl + apiSegment + endpoint;

  @override
  Future<ResponseWrapper<T>> request<T extends Decodeable>({
    HttpMethod httpMethod = HttpMethod.get,
    required Create<T> create,
    dynamic data,
    Map<String, dynamic>? queryParams,
    RequestOptions? config,
  }) async {
    config ??= RequestOptions(path: getUrl(), method: httpMethod.method);
    config.method = httpMethod.method;
    if (data != null) {
      config.data = data;
    }
    if (queryParams != null) {
      config.queryParameters = queryParams;
    }
    try {
      final response = await dio.fetch(config);
      return ResponseWrapper.init(create: create, data: response.data);
    } on DioError catch (err) {
      throw ApiResponseException(message: err.message);
    }
  }
}

abstract class AbstractService<ResultDto, Id, CreateDto, UpdateDto, DeleteDto> {
  Future<Paginated<ResultDto>> getAllEntities({int? page, int? pageSize});
  Future<ResultDto> getEntityById(Id id);
  Future<ResultDto> createEntity(CreateDto? value);
  Future<ResultDto> deleteEntity(Id id, CreateDto? value);
  Future<ResultDto> updateEntity(Id id, UpdateDto value);
}

abstract class BasicService<ResultDto extends Decodeable, Id, CreateDto,
        UpdateDto, DeleteDto> extends AbstractApiClient<ResultDto>
    implements AbstractService<ResultDto, Id, CreateDto, UpdateDto, DeleteDto> {
  BasicService({required super.endpoint, required super.create});

  @override
  Future<Paginated<ResultDto>> getAllEntities(
      {int? page = 1, int? pageSize = 25}) async {
    var response = await request(
      create: () => ApiListResponse<ResultDto>(create: () => create()),
      queryParams: {"page": page, "pageSize": pageSize},
    );

    final results = response.response?.data ?? [];
    return Paginated(data: results, pagination: response.response?.pagination);
  }

  @override
  Future<ResultDto> getEntityById(Id id) async {
    var response = await request(
      create: () => ApiResponse<ResultDto>(create: () => create()),
      config: RequestOptions(path: getUrl() + "/" + id),
    );

    final entity = response.response?.data;
    if (entity == null) {
      throw ApiResponseException(message: "Entity with id $id doesn't exist");
    }
    return entity;
  }

  @override
  Future<ResultDto> createEntity(CreateDto? value) async {
    var response = await request(
      httpMethod: HttpMethod.post,
      create: () => ApiResponse<ResultDto>(create: () => create()),
      data: value,
    );

    final entity = response.response!.data;
    return entity;
  }

  @override
  Future<ResultDto> deleteEntity(Id id, CreateDto? value) async {
    var response = await request(
      httpMethod: HttpMethod.delete,
      create: () => ApiResponse<ResultDto>(create: () => create()),
      config: RequestOptions(path: getUrl() + "/" + id),
    );

    final entity = response.response!.data;
    return entity;
  }

  @override
  Future<ResultDto> updateEntity(Id id, UpdateDto value) async {
    var response = await request(
      httpMethod: HttpMethod.put,
      create: () => ApiResponse<ResultDto>(create: () => create()),
      config: RequestOptions(path: getUrl() + "/" + id),
    );

    final entity = response.response!.data;
    return entity;
  }
}

class Paginated<T> {
  List<T> data = [];
  Pagination? pagination;

  Paginated({required this.data, this.pagination});
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
