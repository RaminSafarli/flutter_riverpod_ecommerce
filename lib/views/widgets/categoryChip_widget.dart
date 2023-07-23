import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_ecommerce/views/widgets/chip_widget.dart';

class CategoryChipWidget extends ConsumerWidget {
  const CategoryChipWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: const [
          ChipWidget(
            title: "All",
            icon: Icons.phone_android,
          ),
          ChipWidget(
            title: "Computers",
            icon: Icons.phone_android,
          ),
          ChipWidget(
            title: "Headsets",
            icon: Icons.phone_android,
          ),
          ChipWidget(
            title: "Speakers",
            icon: Icons.phone_android,
          ),
          ChipWidget(
            title: "Watches",
            icon: Icons.phone_android,
          ),
          ChipWidget(
            title: "Phones",
            icon: Icons.phone_android,
          ),
        ],
      ),
    );
  }
}
