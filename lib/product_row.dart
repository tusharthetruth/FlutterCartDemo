import 'package:cart_demo/constants.dart';
import 'package:cart_demo/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductRow extends StatefulWidget {
  ProductRow({required this.productModel});

  ProductModel productModel;
  @override
  _ProductRowState createState() => _ProductRowState();
}

class _ProductRowState extends State<ProductRow> {
  @override
  Widget build(BuildContext context) {
    ProductModel productModel = widget.productModel;
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[350], borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 30,
              child: Icon(
                Icons.shop,
                size: 40,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModel.productName,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Price ${productModel.price.toString()}",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          const Spacer(),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.remove,
                    size: 20,
                  ),
                  onTap: () {
                    Provider.of<Constants>(context, listen: false)
                        .removeItemInCart(widget.productModel);
                  },
                ),
                Text(
                  widget.productModel.cartCount.toString(),
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<Constants>(context, listen: false)
                        .addItemInCart(widget.productModel);
                  },
                  child: const Icon(
                    Icons.add,
                    size: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
