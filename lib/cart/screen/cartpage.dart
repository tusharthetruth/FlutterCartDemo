import 'package:cart_demo/product/model/product_model.dart';
import 'package:cart_demo/widgets/product_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: CartDataAndNodDataPage(),
    );
  }
}

class CartDataAndNodDataPage extends StatefulWidget {
  const CartDataAndNodDataPage({Key? key}) : super(key: key);

  @override
  _CartDataAndNodDataPageState createState() => _CartDataAndNodDataPageState();
}

class _CartDataAndNodDataPageState extends State<CartDataAndNodDataPage> {
  @override
  Widget build(BuildContext context) {
    int cartCount = Provider.of<Constants>(context).cartList.length;
    if (cartCount == 0) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.add_shopping_cart,
            size: 180,
          ),
          const Center(
            child: Text(
              "Empty cart",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: TextButton(
              child: Text(
                "Continue shopping",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ),
        ],
      );
    } else {
      return CartDataPage();
    }
  }
}

class CartDataPage extends StatelessWidget {
  CartDataPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CartList()),
        Container(
          margin: EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 0),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Value",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                Provider.of<Constants>(context).cartValue.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          width: double.infinity,
          color: Colors.lightBlue,
          child: TextButton(
              child: Text("Buy Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
              onPressed: () {}),
        ),
      ],
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
