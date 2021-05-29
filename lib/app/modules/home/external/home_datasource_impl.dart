import 'package:dio/dio.dart';

import '../../../../shared/http_client/client_error.dart';
import '../../../../shared/http_client/client_interface.dart';
import '../../../../shared/http_client/custom_dio/utils/map_type_error.dart';
import '../infra/datasource/home_datasource.dart';
import '../infra/models/allocation_item_model.dart';
import '../infra/models/day_off_item_model.dart';

class HomeDatasourceImpl implements IHomeDatasource {
  final IClientHttp _client;

  HomeDatasourceImpl(this._client);
  @override
  Future<List<AllocationItemModel>> getAllAllocations() async {
    try {
      List<AllocationItemModel> result = [];

      final response = await _client.get(
        "",
        queryParameters: {"type": "AllocationLog"},
      );

      result = (response.data as List)
          .map((allocation) => AllocationItemModel.fromJson(allocation))
          .toList();

      return result;
    } on DioError catch (e) {
      throw ClientError(
        error: e,
        typeError: MapTypeError.mapDioErrorType(e.type),
        message: e.message,
        statusCode: e.response?.statusCode,
      );
    }
  }

  @override
  Future<List<DayOffItemModel>> getAllDayOffs() async {
    try {
      List<DayOffItemModel> result = [];

      final response = await _client.get(
        "",
        queryParameters: {"type": "SummaryDayOffs"},
      );

      result = (response.data as List)
          .map((dayOff) => DayOffItemModel.fromJson(dayOff))
          .toList();

      return result;
    } on DioError catch (e) {
      throw ClientError(
        error: MapTypeError.mapDioErrorType(e.type),
        message: e.message,
        statusCode: e.response?.statusCode,
      );
    }
  }
}
