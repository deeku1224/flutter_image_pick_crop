import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';

class HistoryPageModal {
  final List<Product> products;
  final String date, year, month, day;
  HistoryPageModal(this.products, this.date, this.year, this.month, this.day);
}

List<HistoryPageModal> historypm = [
  HistoryPageModal([
    Product(
        1,
        120,
        'Mango',
        'assests/images/[removal 7.png',
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
        Colors.yellow,
        true,
        'Pazlam',
        30),
    Product(
        1,
        110,
        'Papaya',
        'assests/images/[removal 7.png',
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
        Colors.yellow,
        true,
        'Pazlam',
        30),
    Product(
        1,
        110,
        'Papaya',
        'assests/images/[removal 7.png',
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
        Colors.yellow,
        true,
        'Pazlam',
        30),
  ], '14', '2020', 'Dec', 'Sat')
];