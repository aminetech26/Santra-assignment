import 'package:get_it/get_it.dart';
import 'package:santra_assignment/data/data_sources/local_data_source.dart';
import 'package:santra_assignment/data/repositories/local_data_repo_impl.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';
import 'package:santra_assignment/presentation/blocs/categories/categories_bloc.dart';

final getItInstance = GetIt.I;

Future initDependencies() async {
  getItInstance.registerLazySingleton<LocalDataRepo>(
      () => LocalDataRepoImpl(getItInstance()));
  getItInstance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl());
  getItInstance.registerFactory(
      () => CategoriesBloc(localDataRepo: getItInstance()));
}
