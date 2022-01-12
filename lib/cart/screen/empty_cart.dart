import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}
