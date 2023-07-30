import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product_model2.dart';

List<Product2> basket = [];

class BasketNotifier extends StateNotifier<List<Product2>> {
  BasketNotifier() : super(basket);

  void addProduct(Product2 product) {
    state = [...state, product];
  }

  void removeProduct(int productId) {
    state = [
      for (var item in state)
        if (item.productId != productId) item,
    ];
  }
}
