import '../../../../../shared/constants/typedefs.dart';

import '../repositories/home_repositoty.dart';

abstract class IGetAllocations {
  AllocationsResult call();
}

class GetAllocations implements IGetAllocations {
  final IHomeRepository _repository;

  GetAllocations(this._repository);
  @override
  AllocationsResult call() async {
    return await _repository.getAllAllocations();
  }
}
