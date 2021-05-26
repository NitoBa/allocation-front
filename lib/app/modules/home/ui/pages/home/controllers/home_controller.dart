import '../stores/insert_allocation_store.dart';
import '../stores/insert_day_off_store.dart';

class HomeController {
  final InsertAllocationStore insertAllocationStore;
  final InsertDayOffStore insertDayOffStore;

  List<String> list = [];

  HomeController(this.insertDayOffStore, this.insertAllocationStore);
}
