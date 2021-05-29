import 'package:allocation_front/shared/http_client/client_error.dart';
import 'package:dio/dio.dart';

class MapTypeError {
  static ClientErrorType mapDioErrorType(DioErrorType dioErrorType) {
    switch (dioErrorType) {
      case DioErrorType.cancel:
        return ClientErrorType.cancel;
      case DioErrorType.response:
        return ClientErrorType.response;
      case DioErrorType.receiveTimeout:
        return ClientErrorType.receiveTimeout;
      case DioErrorType.connectTimeout:
        return ClientErrorType.connectTimeout;
      case DioErrorType.other:
        return ClientErrorType.other;
      case DioErrorType.sendTimeout:
        return ClientErrorType.sendTimeout;
      default:
        return ClientErrorType.other;
    }
  }
}
