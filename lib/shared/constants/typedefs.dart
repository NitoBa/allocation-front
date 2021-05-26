import 'package:allocation_front/app/modules/home/domain/entities/day_off_item_entity.dart';
import 'package:dartz/dartz.dart';

import '../../app/modules/home/domain/entities/allocation_item_entity.dart';
import '../errors/app_errors.dart';

typedef AllocationsResult = Future<Either<Failure, List<AllocationItemEntity>>>;
typedef DayOffsResult = Future<Either<Failure, List<DayOffItemEntity>>>;
