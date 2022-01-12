import 'package:cart_demo/data/constants.dart';
import 'package:cart_demo/product/screen/home_page.dart';
import 'package:cart_demo/route/route.gr.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRounter = FlutterRouter();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Constants(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRounter.defaultRouteParser(),
        routerDelegate: _appRounter.delegate(),
      ),
    );
  }
}
