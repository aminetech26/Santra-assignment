part of 'top_sellers_bloc.dart';

abstract class TopSellersEvent extends Equatable {
  const TopSellersEvent();

  @override
  List<Object> get props => [];
}

class TopSellersLoadEvent extends TopSellersEvent{}