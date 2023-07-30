import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/provider/constant/all_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/themes.dart';

class DetailsPage extends ConsumerWidget {
  int productIndex;
  DetailsPage({super.key, required this.productIndex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final products = ref.watch(productStateNotifier);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text("Product Details"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.local_mall),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              color: lightBackgroundColor,
              width: double.infinity,
              child: Image.asset(products[productIndex].imageUrl),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products[productIndex].title,
                    style: MyTextStyle.detailTitleStyle,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      RatingBar(
                        itemSize: 20,
                        initialRating: products[productIndex].rating,
                        minRating: 1,
                        maxRating: 5,
                        allowHalfRating: true,
                        ratingWidget: RatingWidget(
                          empty: const Icon(
                            Icons.star_border,
                            color: Colors.amber,
                          ),
                          full: const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          half: const Icon(
                            Icons.star_half_sharp,
                            color: Colors.amber,
                          ),
                        ),
                        onRatingUpdate: (value) => null,
                      ),
                      const SizedBox(width: 12),
                      Text('${products[productIndex].review} reviews'),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(products[productIndex].description),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${products[productIndex].price * products[productIndex].quantity}",
                        style: MyTextStyle.detailTitleStyle,
                      ),
                      Container(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(productStateNotifier.notifier)
                                    .decrementQuantity(
                                        products[productIndex].productId);
                              },
                              icon: const Icon(
                                Icons.do_not_disturb_on_outlined,
                                size: 30,
                              ),
                            ),
                            Text(
                              products[productIndex].quantity.toString(),
                              style: MyTextStyle.quantityTextStyle,
                            ),
                            IconButton(
                              onPressed: () {
                                ref
                                    .read(productStateNotifier.notifier)
                                    .incrementQuantity(
                                        products[productIndex].productId);
                              },
                              icon: const Icon(
                                Icons.add_circle_outline,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: const Text("Add item to bag"),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => {
          ref.read(currentIndexProvider.notifier).update((state) => value),
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Color(0xFFC7C7C7),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home_filled),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: "Favorite",
            activeIcon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "Location",
            activeIcon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: "Notfication",
            activeIcon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
            activeIcon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
