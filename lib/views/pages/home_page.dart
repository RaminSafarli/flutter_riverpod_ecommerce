import 'package:flutter/material.dart';
import 'package:flutter_riverpod_ecommerce/constants/themes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/banner_widget.dart';
import '../widgets/categoryChip_widget.dart';
import '../widgets/productCard_widget.dart';
import '../widgets/productTitle_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: SvgPicture.asset("assets/images/logo.svg"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.local_mall),
            ),
          ],
        ),
        drawer: const Drawer(
          backgroundColor: appBarColor,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const BannerWidget(),
                const CategoryChipWidget(),
                const SizedBox(height: 10),
                ProductTitleWidget(
                  title: "Hot sales",
                  function: () {},
                ),
                const SizedBox(height: 8),
                const ProductCardWidget(1),
                const SizedBox(height: 8),
                ProductTitleWidget(
                  title: "Featured products",
                  function: () {},
                ),
                MasonryGridView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 4,
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    // return const SizedBox(
                    //   // height: 300,
                    //   child: ProductCardWidget(),
                    // );
                    return const ProductCardWidget(2);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
