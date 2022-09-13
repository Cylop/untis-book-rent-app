abstract class AbstractApiService<ResultDto, Id, CreateDto, UpdateDto,
    DeleteDto> {
  String baseUrl = 'https://localhost:3000';
  String apiUrl = '/api/v1/';

  final String endpoint;

  AbstractApiService({required this.endpoint});

  Future<List<ResultDto>> getAll();

  Future<ResultDto> getById(Id id);

  Future<ResultDto> create(CreateDto value);

  Future<ResultDto> update(Id id, UpdateDto value);

  Future<ResultDto> delete(Id id);
}
