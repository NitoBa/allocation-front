import 'package:allocation_front/shared/errors/app_errors.dart';
import 'package:allocation_front/shared/http_client/client_error.dart';
import 'package:allocation_front/shared/http_client/custom_dio/utils/map_type_error.dart';
import 'package:dio/dio.dart';

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
