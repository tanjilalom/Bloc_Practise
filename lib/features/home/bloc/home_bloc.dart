import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {

    on<HomeProductWishlistClickedEvent>(homeProductWishlistClickedEvent);

    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
  }

  FutureOr<void> homeProductWishlistClickedEvent(
      HomeProductWishlistClickedEvent event, Emitter<HomeState> emit) {
    print('wishlist button clicked');
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    print('Cart button clicked');
  }
}