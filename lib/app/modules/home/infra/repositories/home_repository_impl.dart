import 'package:dartz/dartz.dart';

import '../../../../../shared/constants/typedefs.dart';
import '../../../../../shared/errors/app_errors.dart';
import '../../../../../shared/http_client/client_error.dart';
import '../../domain/repositories/home_repositoty.dart';
import '../datasource/home_datasource.dart';

class HomeRepositoryImpl implements IHomeRepository {
  final IHomeDatasource _datasource;

  HomeRepositoryImpl(this._datasource);
  @override
  AllocationsResult getAllAllocations() async {
    try {
      final result = await _datasource.getAllAllocations();
      return Right(result);
    } on ClientError catch (e) {
      if (e.typeError == ClientErrorType.connectTimeout ||
          e.typeError == ClientErrorType.receiveTimeout) {
        return Left(ErrorMessage(message: 'time out connection'));
      } else {
        return Left(ErrorMessage(message: 'error to get allocations'));
      }
    }
  }

  @override
  DayOffsResult getAllDayOffs() async {
    try {
      final result = await _datasource.getAllDayOffs();
      return Right(result);
    } on ClientError catch (e) {
      if (e.typeError == ClientErrorType.connectTimeout ||
          e.typeError == ClientErrorType.receiveTimeout) {
        return Left(ErrorMessage(message: 'time out connection'));
      } else {
        return Left(ErrorMessage(message: 'error to get day offs'));
      }
    }
  }

  @override
  ProjectResumesResult getAllProjectResumes() async {
    try {
      final result = await _datasource.getProjectResumes();
      return Right(result);
    } on ClientError catch (e) {
      if (e.typeError == ClientErrorType.connectTimeout ||
          e.typeError == ClientErrorType.receiveTimeout) {
        return Left(ErrorMessage(message: 'time out connection'));
      } else {
        return Left(ErrorMessage(message: 'error to get project resumes'));
      }
    }
  }
}
