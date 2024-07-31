part of 'shop_card_bloc.dart';

abstract class ShopCardEvent extends Equatable {
  const ShopCardEvent();

  @override
  List<Object> get props => [];
}

class ShopCardLoad extends ShopCardEvent{}
