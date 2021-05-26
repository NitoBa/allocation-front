import 'package:allocation_front/shared/http_client/client_interface.dart';
import 'package:allocation_front/shared/http_client/custom_dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dioMock;
  late IClientHttp<Dio> dio;
  setUp(() {
    dioMock = DioMock();
    dio = DioClient(clientMock: dioMock);
  });

  test('Dio teste', () async {
    dio.client.get("path");
  });
}
