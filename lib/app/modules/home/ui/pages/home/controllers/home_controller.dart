import '../stores/get_allocations_store.dart';
import '../stores/get_day_off_store.dart';
import '../stores/get_project_resumes_store.dart';
import '../stores/insert_allocation_store.dart';
import '../stores/insert_day_off_store.dart';

class HomeController {
  final InsertAllocationStore insertAllocationStore;
  final InsertDayOffStore insertDayOffStore;
  final GetAllocationsStore getAllocationsStore;
  final GetDayOffStore getDayOffStore;
  final GetProjectResumeStore getProjectResumeStore;

  HomeController(
    this.insertDayOffStore,
    this.insertAllocationStore,
    this.getAllocationsStore,
    this.getDayOffStore,
    this.getProjectResumeStore,
  );

  void getAllAllocations() => getAllocationsStore();
  void getAllDayOffs() => getDayOffStore();
  void getProjectResumes() => getProjectResumeStore();
}
