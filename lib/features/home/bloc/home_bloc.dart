import 'dart:async';
import 'package:bloc_practise/data/grovery_data.dart';
import 'package:bloc_practise/features/home/models/home_product_data_models.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>((event, emit) async {
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
    });

    on<HomeWishlistButtonNavigateEvent>((event, emit) {
      print('Wishlist Nav clicked');
      emit(HomeNavigatetoTimeDetailsState());
    });

    on<HomeCartButtonNavigateEvent>((event, emit) {
      print('Wishlist Nav clicked');
      emit(HomeNavigatetoCartState());
    });
  }
}
