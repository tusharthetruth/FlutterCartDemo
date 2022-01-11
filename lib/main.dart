import 'package:cart_demo/constants.dart';
import 'package:cart_demo/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Constants(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductPage(),
      ),
    );
  }
}
