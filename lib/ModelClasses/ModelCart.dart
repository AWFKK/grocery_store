import 'package:flutter/material.dart';
import 'package:n_store/ModelClasses/ModelProduct.dart';

class Cart {
  final Product product;
  final int numOfItem;

  Cart({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<Cart> demoCarts = [
  Cart(product: products[0], numOfItem: 2),
  Cart(product: products[1], numOfItem: 1),
  Cart(product: products[3], numOfItem: 1),
  Cart(product: products[4], numOfItem: 1),
  Cart(product: products[2], numOfItem: 1),
  Cart(product: products[6], numOfItem: 1),
  Cart(product: products[5], numOfItem: 1),
];
