part of 'home_slider_bloc.dart';

abstract class HomeSliderEvent extends Equatable {
  const HomeSliderEvent();

  @override
  List<Object> get props => [];
}
class HomeSliderLoadEvent extends HomeSliderEvent{}