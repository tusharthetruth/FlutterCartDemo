import 'dart:core';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  ProductModel(
      {required this.productId,
      required this.productName,
      required this.productCategory,
      required this.price,
      required this.cartCount,
      required this.icon});

  int productId;
  String productName;
  int productCategory;
  int price;
  int cartCount;
  String icon;

  @override
  List<Object?> get props => [productId];
}
