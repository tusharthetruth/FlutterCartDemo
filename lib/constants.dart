import 'package:cart_demo/product_model.dart';
import 'package:flutter/material.dart';

class Constants extends ChangeNotifier {
  List<ProductModel> productList = [];
  List<ProductModel> clothesList = [];
  List<ProductModel> groceryList = [];
  List<ProductModel> cartList = [];
  double cartValue = 0;

  void updateCartValue() {
    cartValue = 0;
    for (int i = 0; i < cartList.length; i++) {
      ProductModel productModel = cartList[i];
      cartValue = cartValue + (productModel.price * productModel.cartCount);
    }
  }

  void addProducts(List<ProductModel> list) {
    productList.addAll(list);
    setClothesList();
    setGroceryList();
    notifyListeners();
  }

  void addItemInCart(ProductModel model) {
    bool _itemIsNotInCart = true;
    if (model.productCategory == 1) {
      for (int i = 0; i < clothesList.length; i++) {
        if (clothesList[i].productId == model.productId) {
          cartList.remove(model);
          clothesList[i].cartCount = clothesList[i].cartCount + 1;
          cartList.add(clothesList[i]);
        }
      }
    } else if (model.productCategory == 2) {
      for (int i = 0; i < groceryList.length; i++) {
        if (groceryList[i].productId == model.productId) {
          cartList.remove(model);
          groceryList[i].cartCount = groceryList[i].cartCount + 1;
          cartList.add(groceryList[i]);
        }
      }
    }
    updateCartValue();
    notifyListeners();
  }

  void removeItemInCart(ProductModel model) {
    if (model.productCategory == 1) {
      for (int i = 0; i < clothesList.length; i++) {
        if (clothesList[i].productId == model.productId) {
          cartList.remove(model);
          if (clothesList[i].cartCount != 0) {
            clothesList[i].cartCount = clothesList[i].cartCount - 1;
            if (clothesList[i].cartCount > 0) {
              cartList.add(clothesList[i]);
            }
          }
        }
      }
    } else if (model.productCategory == 2) {
      for (int i = 0; i < groceryList.length; i++) {
        if (groceryList[i].productId == model.productId) {
          cartList.remove(model);
          if (groceryList[i].cartCount != 0) {
            groceryList[i].cartCount = groceryList[i].cartCount - 1;
            if (groceryList[i].cartCount > 0) {
              cartList.add(groceryList[i]);
            }
          }
        }
      }
    }
    updateCartValue();
    notifyListeners();
  }

  void setClothesList() {
    for (int i = 0; i < productList.length; i++) {
      if (productList[i].productCategory == 1) {
        clothesList.add(productList[i]);
      }
    }
  }

  void setGroceryList() {
    for (int i = 0; i < productList.length; i++) {
      if (productList[i].productCategory == 2) {
        groceryList.add(productList[i]);
      }
    }
  }
}
