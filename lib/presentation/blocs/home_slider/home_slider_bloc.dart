import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:santra_assignment/data/models/home_slider.dart';
import 'package:santra_assignment/di/get_it.dart';
import 'package:santra_assignment/domain/entities/app_error.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';
part 'home_slider_event.dart';
part 'home_slider_state.dart';

class HomeSliderBloc extends Bloc<HomeSliderEvent, HomeSliderState> {
  LocalDataRepo localDataRepo;
  HomeSliderBloc({required this.localDataRepo}) : super(HomeSliderInitial()) {
    localDataRepo = getItInstance<LocalDataRepo>();
    on<HomeSliderEvent>((event, emit) async {
      if (event is HomeSliderLoadEvent) {
        final data = await localDataRepo.getData();
        data.fold(
            (l) => emit(HomeSliderLoadError(appErrorType: l.appErrorType)),
            (jsonResult) => emit(HomeSliderLoaded(
                homeSliders: jsonResult.data![0].dataSliderTop![0].homeSlider!)));
      }
    });
  }
}
