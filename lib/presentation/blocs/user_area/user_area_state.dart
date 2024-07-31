part of 'user_area_bloc.dart';

abstract class UserAreaState extends Equatable {
  const UserAreaState();

  @override
  List<Object> get props => [];
}

class UserAreaInitial extends UserAreaState {}

class UserAreaLoaded extends UserAreaState {
  final String userArea;

  const UserAreaLoaded({required this.userArea}) : super();

  @override
  List<Object> get props => [userArea];
}


  class UserAreaLoadError extends UserAreaState {

    final AppErrorType errorType;
    const UserAreaLoadError({required this.errorType}) : super();

    @override
    List<Object> get props => [errorType];
  }