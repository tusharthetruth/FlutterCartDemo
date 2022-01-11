import 'dart:core';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  ProductModel(
      {required this.productId,
      required this.productName,
      required this.productCategory,
      required this.price,
      required this.cartCount});

  int productId;
  String productName;
  int productCategory;
  int price;
  int cartCount;

  @override
  List<Object?> get props => [productId];
}
