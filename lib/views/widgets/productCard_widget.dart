import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/themes.dart';
import '../../models/product_model.dart';
import '../../provider/constant/all_provider.dart';

class ProductCardWidget extends ConsumerWidget {
  final int filterId;
  const ProductCardWidget(
    this.filterId, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref
        .watch(productStateNotifier)
        .where((element) => element.filterCategoryId == filterId)
        .toList();
    final basketProducts = ref.watch(addToCartStateNotifier.notifier);
    return SizedBox(
      height: 257,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: productBackgroundColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 6),
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]),
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      products[index].imageUrl,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index].title,
                        style: MyTextStyle.productTitleStyle,
                      ),
                      Text(
                        products[index].shortDescription,
                        style: MyTextStyle.productDescStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${products[index].price}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ref
                                  .read(productStateNotifier.notifier)
                                  .toggle(products[index]);

                              if (products[index].isSelected == false) {
                                ref
                                    .read(basketProvider.notifier)
                                    .addProduct(products[index]);
                              } else {
                                ref
                                    .read(basketProvider.notifier)
                                    .removeProduct(products[index].productId);
                              }
                            },
                            icon: products[index].isSelected
                                ? const Icon(Icons.check_circle)
                                : const Icon(Icons.add_circle),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );

    // AsyncValue<ProductModel> productModel = ref.watch(productsProvider);
    // return productModel.when(
    //   data: (productModel) {
    //     final products = productModel.products;
    //     return SizedBox(
    //       height: 257,
    //       width: double.infinity,
    //       child: ListView.builder(
    //         scrollDirection: Axis.horizontal,
    //         shrinkWrap: true,
    //         itemCount: products.length,
    //         itemBuilder: (context, index) {
    //           return Container(
    //             padding: const EdgeInsets.all(5),
    //             margin: const EdgeInsets.all(8),
    //             decoration: BoxDecoration(
    //                 color: productBackgroundColor,
    //                 borderRadius: BorderRadius.circular(8),
    //                 boxShadow: [
    //                   BoxShadow(
    //                     offset: const Offset(0, 1),
    //                     color: Colors.black.withOpacity(0.2),
    //                     spreadRadius: 1,
    //                   ),
    //                 ]),
    //             width: MediaQuery.of(context).size.width * 0.5,
    //             child: Column(
    //               children: [
    //                 Expanded(
    //                   child: Container(
    //                     width: double.infinity,
    //                     padding: const EdgeInsets.all(6),
    //                     child: Image.asset(
    //                       products[index].imageUrl,
    //                     ),
    //                   ),
    //                 ),
    //                 Padding(
    //                   padding: const EdgeInsets.all(8.0),
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         products[index].title,
    //                         style: MyTextStyle.productTitleStyle,
    //                       ),
    //                       Text(
    //                         products[index].shortDescription,
    //                         style: MyTextStyle.productDescStyle,
    //                       ),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Text(
    //                             products[index].price,
    //                             style: const TextStyle(
    //                               fontWeight: FontWeight.bold,
    //                             ),
    //                           ),
    //                           IconButton(
    //                             onPressed: () {},
    //                             icon: const Icon(
    //                               Icons.add_circle,
    //                               size: 28,
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           );
    //         },
    //       ),
    //     );
    //   },
    //   error: (err, stack) => Text('Error: $err'),
    //   loading: () => const CircularProgressIndicator(),
    // );
  }
}
