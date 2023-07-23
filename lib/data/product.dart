import 'package:flutter_riverpod_ecommerce/models/product_model2.dart';

final List<Product2> products = [
  Product2(
      productId: 1,
      title: "Beats Headphone",
      shortDescription: "Lorem short 1",
      description: "lorem lorem full desc",
      rating: 4.5,
      review: 12,
      imageUrl: "assets/images/magicWireless.png",
      price: 45.60,
      filterCategoryId: 1,
      isSelected: false),
  Product2(
      productId: 2,
      title: "Macbook",
      shortDescription: "Lorem short 2",
      description: "lorem lorem full desc 2",
      rating: 2.5,
      review: 9,
      imageUrl: "assets/images/macbook.png",
      price: 45.60,
      filterCategoryId: 1,
      isSelected: true),
  Product2(
      productId: 3,
      title: "iPad",
      shortDescription: "Lorem short 3",
      description: "lorem lorem full desc 3",
      rating: 4.7,
      review: 32,
      imageUrl: "assets/images/ipad.png",
      price: 45.60,
      filterCategoryId: 2,
      isSelected: false),
  Product2(
      productId: 4,
      title: "iPad",
      shortDescription: "Lorem short 4",
      description: "lorem lorem full desc 4",
      rating: 4.7,
      review: 32,
      imageUrl: "assets/images/appleWatch.png",
      price: 45.60,
      filterCategoryId: 2,
      isSelected: false),
];
