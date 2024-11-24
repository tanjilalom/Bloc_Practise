import 'package:bloc_practise/features/home/models/home_product_data_models.dart';
import 'package:flutter/material.dart';

class ProductTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;

  const ProductTileWidget({super.key, required this.productDataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl)
              )
            ),
          ),
          Text(productDataModel.id),
          Text("Name : ${productDataModel.name}", style: const TextStyle(fontSize: 22),),
          Text(productDataModel.description, style: const TextStyle(fontSize: 18),),
          Text("Price : ${productDataModel.price.toString()}", style: const TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}
