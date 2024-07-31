part of 'user_area_bloc.dart';

abstract class UserAreaEvent extends Equatable {
  const UserAreaEvent();

  @override
  List<Object> get props => [];
}

class UserAreaLoad extends UserAreaEvent{}
