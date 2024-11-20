part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeProductWishlistClickedEvent extends HomeEvent {}

class HomeProductCartButtonClickedEvent extends HomeEvent {}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}
