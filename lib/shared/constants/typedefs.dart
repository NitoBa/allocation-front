import 'package:dartz/dartz.dart';

import '../../app/modules/home/domain/entities/allocation_item_entity.dart';
import '../../app/modules/home/domain/entities/day_off_item_entity.dart';
import '../../app/modules/home/domain/entities/project_resume_entity.dart';
import '../errors/app_errors.dart';

typedef AllocationsResult = Future<Either<Failure, List<AllocationItemEntity>>>;
typedef DayOffsResult = Future<Either<Failure, List<DayOffItemEntity>>>;
typedef ProjectResumesResult
    = Future<Either<Failure, List<ProjectResumeEntity>>>;
