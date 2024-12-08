import 'package:bloc_practise/features/cart/ui/cart.dart';
import 'package:bloc_practise/features/home/bloc/home_bloc.dart';
import 'package:bloc_practise/features/home/ui/product_tile_widget.dart';
import 'package:bloc_practise/features/time_details_note/ui/time_details_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigatetoCartState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigatetoTimeDetailsState) {
          debugPrint("/////////////////////////////////////////////");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TimeDetailsNote()));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text('Store'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeTimeDetailsButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.note_alt_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateEvent());
                      },
                      icon: const Icon(Icons.list_alt_outlined)),
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return ProductTileWidget(
                        productDataModel: successState.products[index]);
                  }),
            );

          case HomeErrorState:
            return const Center(
              child: Text('Error Occured'),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
