import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:santra_assignment/data/models/top_sellers.dart';
import 'package:santra_assignment/di/get_it.dart';
import 'package:santra_assignment/domain/entities/app_error.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';

part 'top_sellers_event.dart';
part 'top_sellers_state.dart';

class TopSellersBloc extends Bloc<TopSellersEvent, TopSellersState> {
  LocalDataRepo localDataRepo;
  TopSellersBloc({required this.localDataRepo}) : super(TopSellersInitial()) {
    localDataRepo = getItInstance<LocalDataRepo>();
    on<TopSellersEvent>((event, emit) async{
      if(event is TopSellersLoadEvent){
        final data = await localDataRepo.getData();
        data.fold(
            (l) => emit(TopSellersLoadError(appErrorType: l.appErrorType)),
            (jsonResult) => emit(TopSellersLoaded(
                topSellers: jsonResult.data![0].dataSliderTop![0].topSellers!)));
      }
    });
  }
}
