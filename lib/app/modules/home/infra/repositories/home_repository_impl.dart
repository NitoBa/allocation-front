import '../../../../../shared/constants/typedefs.dart';
import '../../domain/repositories/home_repositoty.dart';
import '../datasource/home_datasource.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeDatasource _datasource;

  HomeRepositoryImpl(this._datasource);
  @override
  AllocationsResult getAllAllocations() {
    // TODO: implement getAllAllocations
    throw UnimplementedError();
  }

  @override
  DayOffsResult getAllDayOffs() {
    // TODO: implement getAllDayOffs
    throw UnimplementedError();
  }
}
