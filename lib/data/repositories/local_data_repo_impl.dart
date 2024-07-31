import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:santra_assignment/data/data_sources/local_data_source.dart';
import 'package:santra_assignment/data/models/results_model.dart';
import 'package:santra_assignment/domain/entities/app_error.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';

class LocalDataRepoImpl extends LocalDataRepo {
  final LocalDataSource localDataSource;
  LocalDataRepoImpl(this.localDataSource);
  @override
  Future<Either<AppError, JsonResults>> getData() async {
    try {
      final data = await localDataSource.getData();
      return Right(data);
    } on SocketException {
      return const Left(AppError(appErrorType: AppErrorType.network));
    } on Exception {
      return const Left(AppError(appErrorType: AppErrorType.api));
    }
  }
}
