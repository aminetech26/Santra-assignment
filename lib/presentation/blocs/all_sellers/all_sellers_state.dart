part of 'all_sellers_bloc.dart';

abstract class AllSellersState extends Equatable {
  const AllSellersState();
  
  @override
  List<Object> get props => [];
}

class AllSellersInitial extends AllSellersState {}
class AllSellersLoaded extends AllSellersState {
  final List<AllSellers> allSellers;
  const AllSellersLoaded({required this.allSellers});

  @override
  List<Object> get props => [allSellers];
}

class AllSellersLoadError extends AllSellersState{
  final AppErrorType appErrorType;
  const AllSellersLoadError({required this.appErrorType});
  @override
  List<Object> get props => [appErrorType];
}