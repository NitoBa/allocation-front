import '../models/allocation_item_model.dart';
import '../models/day_off_item_model.dart';

abstract class IHomeDatasource {
  Future<List<AllocationItemModel>> getAllAllocations();
  Future<List<DayOffItemModel>> getAllDayOffs();
}
