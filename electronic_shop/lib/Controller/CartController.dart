import 'package:flutter/material.dart';

import '../Models/Product.dart';

class CartController with ChangeNotifier{

  List<Product>CartProduct=[];

  AddProductToCart(Product product){
    CartProduct.add(product);
    notifyListeners();
  }

  RemoveProduct(Product product){
    CartProduct.remove(product);
    notifyListeners();
  }

  get CartLength =>CartProduct.length;


}