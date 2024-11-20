/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/wishlist_bloc.dart';
import '../bloc/wishlist_state.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<WishlistBloc, WishlistState>(
          listener: (context, state) {
            // TODO: implement listener}
          },
          child: Column(
            children: [
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return Container();
                },
              ),
              BlocSelector<WishlistBloc, WishlistState, dynamic>(
                // TODO: change dynamic type
                selector: (state) {
                  // TODO: return selected state based on the provided state.
                  return state.name;
                },
                builder: (context, state) {
                  // TODO: return widget here based on the selected state.
                  return Text(state.toString());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
*/
