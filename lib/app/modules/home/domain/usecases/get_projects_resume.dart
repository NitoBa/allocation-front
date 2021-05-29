import 'package:allocation_front/app/modules/home/domain/repositories/home_repositoty.dart';

import '../../../../../shared/constants/typedefs.dart';

abstract class IGetProjectResumes {
  ProjectResumesResult call();
}

class GetProjectResumes implements IGetProjectResumes {
  final IHomeRepository _repository;

  GetProjectResumes(this._repository);
  @override
  ProjectResumesResult call() async {
    return await _repository.getAllProjectResumes();
  }
}
