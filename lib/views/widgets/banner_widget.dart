import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/provider/constant/all_provider.dart';

import '../../constants/themes.dart';

class BannerWidget extends ConsumerWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(left: 35, right: 35, top: 15),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bannerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ref.read(bannerTitle),
                  style: MyTextStyle.bannerTitleStyle,
                ),
                const SizedBox(height: 10),
                Text(
                  ref.read(bannerDesc),
                  style: MyTextStyle.textStyle,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(0),
                  ),
                  child: const Text(
                    "Shop new Year",
                    style: TextStyle(color: Color(0xFFFFDCBC)),
                  ),
                )
              ],
            ),
          ),
          Image.asset(
            'assets/images/bannerImage.png',
          )
        ],
      ),
    );
  }
}
