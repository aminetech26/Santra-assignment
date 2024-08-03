import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:santra_assignment/di/get_it.dart';
import 'package:santra_assignment/domain/entities/app_error.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';

part 'shop_card_event.dart';
part 'shop_card_state.dart';

class ShopCardBloc extends Bloc<ShopCardEvent, ShopCardState> {
  LocalDataRepo localDataRepo;
  ShopCardBloc({required this.localDataRepo}) : super(ShopCardInitial()) {
    localDataRepo = getItInstance<LocalDataRepo>();
    on<ShopCardEvent>((event, emit) async {
      if (event is ShopCardLoad) {
        final data = await localDataRepo.getData();
        data.fold((l) {
          emit(ShopCardError(errorType: l.appErrorType));
        }, (jsonResult) {
          emit(ShopCardLoaded(
              itemsNumber: jsonResult.data![0].dataSliderTop![0]
                  .orderInProcess![0].numberOrders!));
        });
      }
    });
  }
}
