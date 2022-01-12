import 'package:auto_route/auto_route.dart';
import 'package:cart_demo/cart/screen/cartpage.dart';
import 'package:cart_demo/product/screen/product_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(initial: true, page: ProductPage, name: 'product_route'),
  AutoRoute(page: CartPage, name: 'cart_route'),
])
class $FlutterRouter {}
