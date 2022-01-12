import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/constants.dart';
import 'cart_data.dart';
import 'empty_cart.dart';

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
      return EmptyCart();
    } else {
      return CartDataPage();
    }
  }
}
