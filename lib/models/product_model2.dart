class Product2 {
  final int productId;
  final String title;
  final String shortDescription;
  final String description;
  final double rating;
  final int review;
  final String imageUrl;
  final double price;
  final int filterCategoryId;
  bool isSelected;
  int quantity;

  Product2(
      {required this.productId,
      required this.title,
      required this.shortDescription,
      required this.description,
      required this.rating,
      required this.review,
      required this.imageUrl,
      required this.price,
      required this.filterCategoryId,
      required this.isSelected,
      required this.quantity});

  Product2 copyWith(
      {int? productId,
      String? title,
      String? shortDescription,
      String? description,
      double? rating,
      int? review,
      String? imageUrl,
      double? price,
      int? filterCategoryId,
      bool? isSelected,
      int? quantity}) {
    return Product2(
        productId: productId ?? this.productId,
        description: description ?? this.description,
        filterCategoryId: filterCategoryId ?? this.filterCategoryId,
        imageUrl: imageUrl ?? this.imageUrl,
        isSelected: isSelected ?? this.isSelected,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        review: review ?? this.review,
        shortDescription: shortDescription ?? this.shortDescription,
        title: title ?? this.title,
        quantity: quantity ?? this.quantity);
  }
}
