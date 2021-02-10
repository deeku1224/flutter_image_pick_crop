import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';

// class NonVeg {
//   final int id;
//   final double price;
//   final String name;
//   final String image;
//   final double min;
//   final double inc;
//   final double max;
//   final String description, p1, p2, p3;
//   final double p1Percent, p2Percent, p3Percent;

//   final Color bgColor;
//   NonVeg(
//     this.id,
//     this.price,
//     this.name,
//     this.image,
//     this.min,
//     this.inc,
//     this.max,
//     this.description,
//     this.p1,
//     this.p1Percent,
//     this.p2,
//     this.p2Percent,
//     this.p3,
//     this.p3Percent,
//     this.bgColor,
//   );
// }

List<Product> homeNonVeg = [
  Product(
      1,
      35,
      'Capsicum',
      'assests/images/Ellipse 7.png',
      (1 / 2),
      1,
      4,
      'Lorem \n ipsum \n dolor ',
      'Nutrients',
      85,
      'Vitamin',
      50,
      'Carbohydrate',
      60,
      Colors.red,
      true,
      'Pazlam',
      30),
  Product(
      2,
      65,
      'Capsicum',
      'assests/images/Ellipse 7.png',
      (1 / 2),
      1,
      4,
      'Lorem \n ipsum \n dolor ',
      'Nutrients',
      85,
      'Vitamin',
      50,
      'Carbohydrate',
      60,
      Colors.red,
      false,
      'Pazlam',
      30),
  Product(
      3,
      35,
      'Capsicum',
      'assests/images/Ellipse 7.png',
      (1 / 2),
      1,
      4,
      'Lorem \n ipsum \n dolor ',
      'Nutrients',
      85,
      'Vitamin',
      50,
      'Carbohydrate',
      60,
      Colors.red,
      false,
      'Pazlam',
      30),
];
