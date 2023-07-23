import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  final List<Product> products;

  ProductModel({
    required this.products,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

// For Json

class Product {
  final int productId;
  final String title;
  final String shortDescription;
  final String description;
  final double rating;
  final int review;
  final String imageUrl;
  final String price;

  Product({
    required this.productId,
    required this.title,
    required this.shortDescription,
    required this.description,
    required this.rating,
    required this.review,
    required this.imageUrl,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        title: json["title"],
        shortDescription: json["shortDescription"],
        description: json["description"],
        rating: json["rating"]?.toDouble(),
        review: json["review"],
        imageUrl: json["imageUrl"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "title": title,
        "shortDescription": shortDescription,
        "description": description,
        "rating": rating,
        "review": review,
        "imageUrl": imageUrl,
        "price": price,
      };
}
