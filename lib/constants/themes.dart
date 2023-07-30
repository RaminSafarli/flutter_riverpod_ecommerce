import 'package:flutter/material.dart';

const bannerColor = Color.fromARGB(255, 132, 54, 104);
const appBarColor = Color.fromARGB(255, 2, 34, 56);
const backgroundColor = Color.fromARGB(255, 246, 246, 246);
const productBackgroundColor = Color.fromARGB(255, 244, 252, 254);
const lightBackgroundColor = Color(0xFFF3FAFF);
const primaryColor = Color(0xFF843667);

class MyTextStyle {
  static const bannerTitleStyle = TextStyle(
    fontSize: 19.75,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const detailTitleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );

  static const quantityTextStyle = TextStyle(
    fontSize: 18.91,
    fontWeight: FontWeight.w500,
    color: Color(0xFF022238),
  );

  static const textStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    letterSpacing: 1.1,
    color: Colors.white,
  );

  static const titleStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const seeAllButtonStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Color(0xFF20ACFD),
  );

  static const productTitleStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );

  static const productDescStyle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
    overflow: TextOverflow.ellipsis,
  );
}
