import '../../../../shared/http_client/client_interface.dart';
import '../infra/datasource/home_datasource.dart';
import '../infra/models/allocation_item_model.dart';
import '../infra/models/day_off_item_model.dart';

class HomeDatasourceImpl implements IHomeDatasource {
  final IClientHttp _client;

  HomeDatasourceImpl(this._client);
  @override
  Future<List<AllocationItemModel>> getAllAllocations() {
    // TODO: implement getAllAllocations
    throw UnimplementedError();
  }

  @override
  Future<List<DayOffItemModel>> getAllDayOffs() {
    // TODO: implement getAllDayOffs
    throw UnimplementedError();
  }
}
