import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:santra_assignment/data/models/all_sellers.dart';
import 'package:santra_assignment/di/get_it.dart';
import 'package:santra_assignment/domain/entities/app_error.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';

part 'all_sellers_event.dart';
part 'all_sellers_state.dart';

class AllSellersBloc extends Bloc<AllSellersEvent, AllSellersState> {
  LocalDataRepo localDataRepo;
  AllSellersBloc({required this.localDataRepo}) : super(AllSellersInitial()) {
    localDataRepo = getItInstance<LocalDataRepo>();
    on<AllSellersEvent>((event, emit) async{
      if (event is AllSellersLoadEvent) {
        final data = await localDataRepo.getData();
        data.fold(
            (l) => emit(AllSellersLoadError(appErrorType: l.appErrorType)),
            (jsonResult) => emit(AllSellersLoaded(
                allSellers: jsonResult.data![0].allSellers!)));
      }
    });
  }
}
