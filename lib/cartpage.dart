import 'package:cart_demo/product_model.dart';
import 'package:cart_demo/product_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Cart'),
          ),
          body: Column(
            children: [
              Expanded(child: CartList()),
              Container(
                margin:
                    EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 0),
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Value"),
                    Text(Provider.of<Constants>(context).cartValue.toString()),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.lightBlue,
                child: TextButton(
                    child:
                        Text("Buy Now", style: TextStyle(color: Colors.white)),
                    onPressed: () {}),
              ),
            ],
          )),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: Provider.of<Constants>(context).cartList.length,
        itemBuilder: (context, index) {
          ProductModel product =
              Provider.of<Constants>(context).cartList[index];
          return ProductRow(
            productModel: product,
          );
        });
  }
}
