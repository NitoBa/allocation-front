import 'package:allocation_front/shared/errors/app_errors.dart';
import 'package:dio/dio.dart';

class CheckConnectionInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.type == DioErrorType.connectTimeout) {
      throw ErrorMessage(
        message: "Error connect time out",
        typeError: NetworkErrorsType.timeout,
      );
    }
    handler.next(err);
  }
}
