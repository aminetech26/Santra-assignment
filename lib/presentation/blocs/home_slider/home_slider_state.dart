part of 'home_slider_bloc.dart';

abstract class HomeSliderState extends Equatable {
  const HomeSliderState();

  @override
  List<Object> get props => [];
}

class HomeSliderInitial extends HomeSliderState {}

class HomeSliderLoaded extends HomeSliderState {
  final List<HomeSlider> homeSliders;
  final bool showHomeSlider;
  const HomeSliderLoaded(
      {required this.homeSliders, this.showHomeSlider = true});

  @override
  List<Object> get props => [homeSliders];
}

class HomeSliderLoadError extends HomeSliderState {
  final AppErrorType appErrorType;
  const HomeSliderLoadError({required this.appErrorType});
  @override
  List<Object> get props => [appErrorType];
}
