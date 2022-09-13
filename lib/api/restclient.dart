import 'package:http/http.dart';

abstract class AbstractRestClient {
  final String baseUrl;

  AbstractRestClient({required this.baseUrl});

  Future<Response> fetch(String path, {Map? headers}) {
    return get(Uri.parse(this.baseUrl + "/" + path));
  }
}
