part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeActionState extends HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeState {}

class HomeNavigatetoWishlistState extends HomeActionState {}

class HomeNavigatetoCartState extends HomeActionState {}
