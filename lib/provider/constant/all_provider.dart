import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/models/product_model.dart';
import 'package:flutter_riverpod_ecommerce/models/product_model2.dart';
import 'package:flutter_riverpod_ecommerce/provider/business/basket_notifier.dart';
import 'package:flutter_riverpod_ecommerce/provider/business/product_notifier.dart';

final bannerTitle = Provider<String>((ref) {
  return "Apple Store";
});

final bannerDesc = Provider<String>((ref) {
  return ("Find the Apple product and accessories you’re looking for");
});

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final productsProvider = FutureProvider<ProductModel>((ref) async {
  final content = json.decode(
    await rootBundle.loadString('assets/data/product_data.json'),
  ) as Map<String, dynamic>;

  return ProductModel.fromJson(content);
});

final productStateNotifier =
    StateNotifierProvider<ProductNotifier, List<Product2>>((ref) {
  return ProductNotifier();
});

final basketProvider =
    StateNotifierProvider<BasketNotifier, List<Product2>>((ref) {
  return BasketNotifier();
});

final addToCartStateNotifier =
    StateNotifierProvider<AddToCartNotifier, List<Product2>>(
  (ref) {
    return AddToCartNotifier();
  },
);

final addCartIcon = StateProvider<IconData>((ref) {
  return Icons.add_circle;
});

final removeCartIcon = StateProvider<IconData>((ref) {
  return Icons.remove_circle;
});

// final isSelectedProvider = StateProvider<bool>((ref) {
//   return 
// })
