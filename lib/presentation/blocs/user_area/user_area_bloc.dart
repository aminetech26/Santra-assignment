import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:santra_assignment/di/get_it.dart';
import 'package:santra_assignment/domain/entities/app_error.dart';
import 'package:santra_assignment/domain/repositories/local_data_repo.dart';

part 'user_area_event.dart';
part 'user_area_state.dart';

class UserAreaBloc extends Bloc<UserAreaEvent, UserAreaState> {
  LocalDataRepo localDataRepo;
  UserAreaBloc({required this.localDataRepo}) : super(UserAreaInitial()) {
    localDataRepo = getItInstance<LocalDataRepo>();
    on<UserAreaEvent>((event, emit) async{
      if(event is UserAreaLoad){
        final data = await localDataRepo.getData();
        data.fold(
            (l) => emit(UserAreaLoadError(errorType: l.appErrorType)),
            (jsonResult) => emit(UserAreaLoaded(
                userArea: jsonResult.data![0].userArea!)));
      }
    });
  }
}
