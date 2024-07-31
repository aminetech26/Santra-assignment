import 'package:get_it/get_it.dart';
import 'package:santra_assignment/data/data_sources/local_data_source.dart';
import 'package:santra_assignment/data/repositories/local_data_repo_impl.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';
import 'package:santra_assignment/presentation/blocs/all_sellers/all_sellers_bloc.dart';
import 'package:santra_assignment/presentation/blocs/categories/categories_bloc.dart';
import 'package:santra_assignment/presentation/blocs/home_slider/home_slider_bloc.dart';
import 'package:santra_assignment/presentation/blocs/shop_card/shop_card_bloc.dart';
import 'package:santra_assignment/presentation/blocs/top_sellers/top_sellers_bloc.dart';
import 'package:santra_assignment/presentation/blocs/user_area/user_area_bloc.dart';

final getItInstance = GetIt.I;

Future initDependencies() async {
  getItInstance.registerLazySingleton<LocalDataRepo>(
      () => LocalDataRepoImpl(getItInstance()));
  getItInstance.registerLazySingleton<LocalDataSource>(
      () => LocalDataSourceImpl());
  getItInstance.registerFactory(
      () => CategoriesBloc(localDataRepo: getItInstance()));
  getItInstance.registerFactory(
  () => AllSellersBloc(localDataRepo: getItInstance()));
  getItInstance.registerFactory(
      () => TopSellersBloc(localDataRepo: getItInstance()));
  getItInstance.registerFactory(
  () => HomeSliderBloc(localDataRepo: getItInstance()));
  getItInstance.registerFactory(
      () => ShopCardBloc(localDataRepo: getItInstance()));
  getItInstance.registerFactory(
      () => UserAreaBloc(localDataRepo: getItInstance()));
}
