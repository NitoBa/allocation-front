import 'package:dio/dio.dart';

import '../../constants/app_constants.dart';
import '../client_interface.dart';
import 'interceptors/check_connection_interceptor.dart';
import 'interceptors/timer_execution_interceptor.dart';

class DioClient implements IClientHttp<Dio> {
  late Dio _dio;

  @override
  Dio get client => _dio;

  final _baseOptios = BaseOptions(
    baseUrl: AppConstants.baseUrl,
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  final _interceptors = <Interceptor>[
    CheckConnectionInterceptor(),
    TimerExecutionInterceptor(),
  ];

  _initConfig({Dio? clientMock}) {
    if (clientMock == null) {
      _dio = Dio(_baseOptios);
      _dio.interceptors.addAll(_interceptors);
    } else {
      _dio = clientMock;
    }
  }

  DioClient({Dio? clientMock}) {
    _initConfig(clientMock: clientMock);
  }
}
