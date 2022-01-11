import 'package:cart_demo/product_model.dart';
import 'package:cart_demo/product_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class Clothes extends StatefulWidget {
  const Clothes({Key? key}) : super(key: key);

  @override
  _ClothesState createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<Constants>(context).clothesList.length,
        itemBuilder: (context, index) {
          ProductModel product =
              Provider.of<Constants>(context).clothesList[index];
          return ProductRow(
            productModel: product,
          );
        });
  }
}
