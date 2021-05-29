import '../../../../../shared/constants/typedefs.dart';

import '../repositories/home_repositoty.dart';

abstract class IGetDayOffs {
  DayOffsResult call();
}

class GetDayOffs implements IGetDayOffs {
  final IHomeRepository _repository;

  GetDayOffs(this._repository);
  @override
  DayOffsResult call() async {
    return await _repository.getAllDayOffs();
  }
}
