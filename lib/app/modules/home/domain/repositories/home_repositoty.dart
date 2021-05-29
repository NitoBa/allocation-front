import '../../../../../shared/constants/typedefs.dart';

abstract class IHomeRepository {
  AllocationsResult getAllAllocations();
  DayOffsResult getAllDayOffs();
  ProjectResumesResult getAllProjectResumes();
}
