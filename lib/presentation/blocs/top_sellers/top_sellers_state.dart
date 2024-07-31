part of 'top_sellers_bloc.dart';

abstract class TopSellersState extends Equatable {
  const TopSellersState();
  
  @override
  List<Object> get props => [];
}

class TopSellersInitial extends TopSellersState {}

class TopSellersLoaded extends TopSellersState {
  final List<TopSellers> topSellers;
  const TopSellersLoaded({required this.topSellers});

  @override
  List<Object> get props => [topSellers];
}

class TopSellersLoadError extends TopSellersState{
  final AppErrorType appErrorType;
  const TopSellersLoadError({required this.appErrorType});
  @override
  List<Object> get props => [appErrorType];
}