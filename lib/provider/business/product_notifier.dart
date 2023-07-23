import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/models/product_model2.dart';

import '../../data/product.dart';

class ProductNotifier extends StateNotifier<List<Product2>> {
  ProductNotifier() : super(products);

  void toggle(Product2 product) {
    state = [
      for (final productItem in products)
        if (product == productItem)
          product.copyWith(isSelected: !productItem.isSelected)
        else
          productItem,
    ];
  }
}

class AddToCartNotifier extends StateNotifier<List<Product2>> {
  AddToCartNotifier() : super([]);

  void addToCart(Product2 product) {
    product.isSelected = true;
    debugPrint(product.isSelected.toString());
    state = [...state, product];
  }
}
