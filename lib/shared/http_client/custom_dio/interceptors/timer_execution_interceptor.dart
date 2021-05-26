import 'package:dio/dio.dart';

class TimerExecutionInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final timer = DateTime.now();
    options.extra['start_time'] = timer.toIso8601String();
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final startTime = DateTime.parse(response.extra['start_time']);
    final totalResquestExection =
        DateTime.now().difference(startTime).inMilliseconds;
    response.data['execution_time'] = totalResquestExection;
    handler.next(response);
  }
}
