import 'package:allocation_front/app/modules/home/domain/entities/allocation_item_entity.dart';
import 'package:allocation_front/app/modules/home/ui/pages/home/stores/get_allocations_store.dart';

import '../stores/insert_allocation_store.dart';
import '../stores/insert_day_off_store.dart';

class HomeController {
  final InsertAllocationStore insertAllocationStore;
  final InsertDayOffStore insertDayOffStore;
  final GetAllocationsStore getAllocationsStore;

  HomeController(
    this.insertDayOffStore,
    this.insertAllocationStore,
    this.getAllocationsStore,
  );

  void getAllAllocations() => getAllocationsStore();
}
