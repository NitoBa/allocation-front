import 'package:dio/dio.dart';

import '../../client_error.dart';
import '../utils/map_type_error.dart';

class CheckConnectionInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    throw ClientError(
      error: err,
      typeError: MapTypeError.mapDioErrorType(err.type),
      message: err.message,
      statusCode: err.response?.statusCode,
    );
  }
}
