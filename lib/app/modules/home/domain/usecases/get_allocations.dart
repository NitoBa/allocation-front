import 'package:dartz/dartz.dart';

import '../../../../../shared/constants/typedefs.dart';
import '../entities/allocation_item_entity.dart';
import '../repositories/home_repositoty.dart';

abstract class IGetAllocations {
  AllocationsResult call();
}

class GetAllocations implements IGetAllocations {
  final IHomeRepository _repository;

  GetAllocations(this._repository);
  @override
  AllocationsResult call() async {
    List<AllocationItemEntity> list = [];
    return Right(list);
  }
}
