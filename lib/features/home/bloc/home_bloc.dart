import 'dart:async';
import 'package:bloc_practise/data/grovery_data.dart';
import 'package:bloc_practise/features/home/models/home_product_data_models.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {

    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);

    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  /*FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {

    emit(HomeLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSuccessState(
        products: GroceryData.groceryProducts
            .map(
              (e) => ProductDataModel(
                  id: e['id'],
                  name: e['name'],
                  description: e['description'],
                  price: e['price'],
                  imageUrl: e['imageUrl']),
            )
            .toList()));
  }*/

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {

    emit(HomeLoadingState());

  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Wishlist Nav clicked');
    emit(HomeNavigatetoWishlistState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('Cart Nav clicked');
    emit(HomeNavigatetoCartState());
  }
}
