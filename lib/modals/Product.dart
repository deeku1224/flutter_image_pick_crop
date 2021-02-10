import 'package:flutter/material.dart';

class Product {
  final int id;
  final double price;
  final String name, tamilName;
  final String image;
  final double min;
  final double inc;
  final double max;
  final double offerPercent;
  final String description, p1, p2, p3;
  final double p1Percent, p2Percent, p3Percent;

  final Color bgColor;
  final bool isFavourite;

  Product(
    this.id,
    this.price,
    this.name,
    this.image,
    this.min,
    this.inc,
    this.max,
    this.description,
    this.p1,
    this.p1Percent,
    this.p2,
    this.p2Percent,
    this.p3,
    this.p3Percent,
    this.bgColor,
    this.isFavourite,
    this.tamilName,
    this.offerPercent,
  );
}
