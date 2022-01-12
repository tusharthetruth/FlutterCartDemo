// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../cart/screen/cartpage.dart' as _i2;
import '../product/screen/product_page.dart' as _i1;

class FlutterRouter extends _i3.RootStackRouter {
  FlutterRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Product_route.name: (routeData) {
      final args = routeData.argsAs<Product_routeArgs>(
          orElse: () => const Product_routeArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.ProductPage(key: args.key));
    },
    Cart_route.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CartPage());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(Product_route.name, path: '/'),
        _i3.RouteConfig(Cart_route.name, path: '/cart-page')
      ];
}

/// generated route for
/// [_i1.ProductPage]
class Product_route extends _i3.PageRouteInfo<Product_routeArgs> {
  Product_route({_i4.Key? key})
      : super(Product_route.name, path: '/', args: Product_routeArgs(key: key));

  static const String name = 'Product_route';
}

class Product_routeArgs {
  const Product_routeArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'Product_routeArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CartPage]
class Cart_route extends _i3.PageRouteInfo<void> {
  const Cart_route() : super(Cart_route.name, path: '/cart-page');

  static const String name = 'Cart_route';
}
