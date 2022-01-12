import 'package:badges/badges.dart';
import 'package:cart_demo/product/screen/clothes_page.dart';
import 'package:cart_demo/data/constants.dart';
import 'package:cart_demo/product/screen/grocery_page.dart';
import 'package:cart_demo/product/model/product_model.dart';
import 'package:cart_demo/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';

const String clothes = 'Clothes';
const String grocery = 'Grocery';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: clothes),
    Tab(text: grocery),
  ];
  String status = clothes;

  late TabController _tabController;
  List data = [];

  Future<String> loadJsonData() async {
    var jsonText = await rootBundle.loadString('asset/product.json');
    setState(() => data = json.decode(jsonText));
    if (data != null) {
      List<ProductModel> list = [];
      for (int i = 0; i < data.length; i++) {
        ProductModel model = ProductModel(
            productId: data[i]['productId'],
            productName: data[i]['productName'],
            productCategory: data[i]['category'],
            price: data[i]['productPrice'],
            cartCount: data[i]['cartCount']);
        list.add(model);
      }
      Provider.of<Constants>(context, listen: false).addProducts(list);
    }
    return 'success';
  }

  @override
  void initState() {
    super.initState();
    loadJsonData();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product"),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          tabs: myTabs,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: EdgeInsets.only(right: 15),
            child: Container(
              child: Badge(
                badgeContent: Text(
                    Provider.of<Constants>(context).cartList.length.toString()),
                child: GestureDetector(
                    onTap: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => CartPage()));
                      context.router.push(Cart_route());
                    },
                    child: Icon(Icons.shopping_cart)),
              ),
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: myTabs.map((Tab tab) {
          setState(() {
            status = tab.text!.toLowerCase();
          });
          return Container(
            child: getTabWidget(status),
          );
        }).toList(),
      ),
    );
  }
}

StatefulWidget getTabWidget(String label) {
  if (label.toLowerCase() == clothes.toLowerCase()) {
    return const Clothes();
  } else {
    return const Grocery();
  }
}
