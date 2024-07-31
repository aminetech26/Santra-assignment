import 'package:dartz/dartz.dart';
import 'package:santra_assignment/data/models/all_sellers.dart';
import 'package:santra_assignment/data/models/categories.dart';
import 'package:santra_assignment/data/models/results_model.dart';
import 'package:santra_assignment/data/models/top_sellers.dart';
import 'package:santra_assignment/domain/entities/app_error.dart';

abstract class LocalDataRepo{
  Future<Either<AppError, JsonResults>> getData();
}