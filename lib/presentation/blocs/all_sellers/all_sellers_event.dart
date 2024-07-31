part of 'all_sellers_bloc.dart';

abstract class AllSellersEvent extends Equatable {
  const AllSellersEvent();

  @override
  List<Object> get props => [];
}

class AllSellersLoadEvent extends AllSellersEvent{}