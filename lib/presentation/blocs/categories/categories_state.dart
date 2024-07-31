part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

class CategoriesInitial extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<Categories> categories;
  const CategoriesLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

class CategoriesLoadError extends CategoriesState {
  final AppErrorType appErrorType;
  const CategoriesLoadError({required this.appErrorType});
  @override
  List<Object> get props => [appErrorType];
}
