import 'package:dartz/dartz.dart';

import '../../../../../shared/constants/typedefs.dart';
import '../entities/day_off_item_entity.dart';
import '../repositories/home_repositoty.dart';

abstract class IGetDayOffs {
  DayOffsResult call();
}

class GetDayOffs implements IGetDayOffs {
  final IHomeRepository _repository;

  GetDayOffs(this._repository);
  @override
  DayOffsResult call() async {
    List<DayOffItemEntity> list = [];
    return Right(list);
  }
}
