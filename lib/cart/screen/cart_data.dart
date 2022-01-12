import 'package:cart_demo/data/constants.dart';
import 'package:cart_demo/product/model/product_model.dart';
import 'package:cart_demo/utils/utils.dart';
import 'package:cart_demo/widgets/product_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              onPressed: () {
                showToast('Coming soon');
              }),
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
