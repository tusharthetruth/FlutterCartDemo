import 'package:cart_demo/data/constants.dart';
import 'package:cart_demo/product/model/product_model.dart';
import 'package:cart_demo/widgets/product_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Grocery extends StatefulWidget {
  const Grocery({Key? key}) : super(key: key);

  @override
  _GroceryState createState() => _GroceryState();
}

class _GroceryState extends State<Grocery> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Provider.of<Constants>(context).groceryList.length,
        itemBuilder: (context, index) {
          ProductModel product =
              Provider.of<Constants>(context).groceryList[index];
          return ProductRow(
            productModel: product,
          );
        });
  }
}
