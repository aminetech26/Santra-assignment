import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:santra_assignment/data/models/categories.dart';
import 'package:santra_assignment/di/get_it.dart';
import 'package:santra_assignment/domain/entities/app_error.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  LocalDataRepo localDataRepo;
  CategoriesBloc({required this.localDataRepo}) : super(CategoriesInitial()) {
    localDataRepo = getItInstance<LocalDataRepo>();
    on<CategoriesEvent>((event, emit) async {
      if (event is CategoriesLoadEvent) {
        final data = await localDataRepo.getData();
        data.fold(
            (l) => emit(CategoriesLoadError(appErrorType: l.appErrorType)),
            (jsonResult) => emit(CategoriesLoaded(
                categories: jsonResult.data![0].dataSliderTop![0].categories!)));
      }
    });
  }
}
