import 'package:allocation_front/shared/http_client/client_response.dart';

abstract class IClientHttp {
  Future<ClientResponse<T>> post<T>(
    String path,
    dynamic data, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
  Future<ClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
