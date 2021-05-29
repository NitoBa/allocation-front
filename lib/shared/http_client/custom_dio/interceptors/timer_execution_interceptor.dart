import 'package:dio/dio.dart';

class TimerExecutionInterceptor extends Interceptor {
  Map<String, dynamic> startTimeGlobal = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final timer = DateTime.now();
    startTimeGlobal['start_time'] = timer.toIso8601String();
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final startTime = DateTime.parse(startTimeGlobal['start_time']);
    final totalResquestExection =
        DateTime.now().difference(startTime).inMilliseconds;
    if (response.data is List) {
      (response.data as List)
          .add({'total_xecution_time': totalResquestExection});
    } else {
      response.data['total_xecution_time'] = totalResquestExection;
    }
    handler.next(response);
  }
}
