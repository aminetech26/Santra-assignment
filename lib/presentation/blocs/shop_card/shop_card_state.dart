part of 'shop_card_bloc.dart';

abstract class ShopCardState extends Equatable {
  const ShopCardState();

  @override
  List<Object> get props => [];
}

class ShopCardInitial extends ShopCardState {}

class ShopCardLoaded extends ShopCardState {
  final int itemsNumber;
  const ShopCardLoaded({required this.itemsNumber});
  @override
  List<Object> get props => [itemsNumber];
}

class ShopCardError extends ShopCardState {
  final AppErrorType errorType;
  const ShopCardError({required this.errorType});
  @override
  List<Object> get props => [errorType];
}
