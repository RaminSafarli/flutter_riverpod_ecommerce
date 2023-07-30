import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/constants/themes.dart';
import 'package:flutter_riverpod_ecommerce/views/pages/details_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../provider/constant/all_provider.dart';
import '../widgets/banner_widget.dart';
import '../widgets/categoryChip_widget.dart';
import '../widgets/productCard_widget.dart';
import '../widgets/productTitle_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    final basket = ref.watch(basketProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: SvgPicture.asset("assets/images/logo.svg"),
        centerTitle: true,
        actions: [
          Badge(
            smallSize: 12,
            largeSize: 12,
            isLabelVisible: basket.length != 0,
            label: Text(basket.length.toString()),
            alignment: Alignment.bottomCenter,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.local_mall),
            ),
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
              GestureDetector(
                  onTap: () {
                    debugPrint("clicked");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          productIndex: 1,
                        ),
                      ),
                    );
                  },
                  child: const ProductCardWidget(1)),
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
                  return GestureDetector(
                    onTap: () {
                      debugPrint("clicked");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                            productIndex: index,
                          ),
                        ),
                      );
                    },
                    child: const ProductCardWidget(2),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => {
          ref.read(currentIndexProvider.notifier).update((state) => value),
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: const Color(0xFFC7C7C7),
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
