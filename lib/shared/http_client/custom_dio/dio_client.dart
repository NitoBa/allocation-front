import 'package:dio/dio.dart';

import '../../constants/app_constants.dart';
import '../client_error.dart';
import '../client_interface.dart';
import '../client_response.dart';
import 'utils/map_type_error.dart';

class DioClient implements IClientHttp {
  late Dio _dio;

  final _baseOptios = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  // final _interceptors = <Interceptor>[
  // CheckConnectionInterceptor(),
  // TimerExecutionInterceptor(),
  // ];

  void _onError(DioError err, ErrorInterceptorHandler handler) {
    throw ClientError(
      error: err,
      typeError: MapTypeError.mapDioErrorType(err.type),
      message: err.message,
      statusCode: err.response?.statusCode,
    );
  }

  _registerInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: _onError));
  }

  _initConfig({Dio? clientMock}) {
    if (clientMock == null) {
      _dio = Dio(_baseOptios);
    } else {
      _dio = clientMock;
    }
    _registerInterceptors();
  }

  DioClient({Dio? clientMock}) {
    _initConfig(clientMock: clientMock);
  }

  @override
  Future<ClientResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final responseDio = await _dio.get(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    final response = ClientResponse<T>(
      data: responseDio.data,
      statusCode: responseDio.statusCode,
      statusMessage: responseDio.statusMessage,
    );

    return response;
  }

  @override
  Future<ClientResponse<T>> post<T>(
    String path,
    data, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) async {
    final responseDio = await _dio.post(
      path,
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );

    final response = ClientResponse<T>(
      data: responseDio.data,
      statusCode: responseDio.statusCode,
      statusMessage: responseDio.statusMessage,
    );

    return response;
  }
}
