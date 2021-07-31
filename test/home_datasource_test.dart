import 'package:allocation_front/app/modules/home/external/home_datasource_impl.dart';
import 'package:allocation_front/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:allocation_front/app/modules/home/infra/models/allocation_item_model.dart';
import 'package:allocation_front/shared/http_client/client_interface.dart';
import 'package:allocation_front/shared/http_client/custom_dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks/app_mocks.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Dio dioMock;
  late IClientHttp dio;
  late IHomeDatasource datasource;
  setUp(() {
    dioMock = DioMock();
    dio = DioClient(clientMock: dioMock);

    datasource = HomeDatasourceImpl(dio);
  });

  test('Home datasource: get all allocations', () async {
    when(() => dioMock.get(
          '',
          queryParameters: {
            'type': 'AllocationLog',
          },
        )).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(
          path: '',
          queryParameters: {
            'type': 'AllocationLog',
          },
        ),
        data: AppMocks.allocationLogMock,
      ),
    );

    final result = await datasource.getAllAllocations();

    expect(result, isA<List<AllocationItemModel>>());
    expect(result, isNotEmpty);
  });

  test('Home datasource: should return an error', () async {
    when(() => dioMock.get(
          '',
          queryParameters: {
            'type': 'AllocationLog',
          },
        )).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(
          path: '',
          queryParameters: {
            'type': 'AllocationLog',
          },
        ),
        data: AppMocks.allocationLogMock,
      ),
    );

    final result = await datasource.getAllAllocations();

    expect(result, isA<List<AllocationItemModel>>());
    expect(result, isNotEmpty);
  });
}
