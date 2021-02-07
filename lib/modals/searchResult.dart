import 'package:flutter/material.dart';

class SearchResult {
  final String image, name, tamilName, description, p1, p2, p3;
  final double price, offerPercent, p1Percent, p2Percent, p3Percent;
  final Color bgColor;
  final int id;
  final bool isFavourite;

  SearchResult(
    this.image,
    this.name,
    this.tamilName,
    this.price,
    this.offerPercent,
    this.id,
    this.description,
    this.p1,
    this.p2,
    this.p3,
    this.p1Percent,
    this.p2Percent,
    this.p3Percent,
    this.bgColor,
    this.isFavourite,
  );
}

List<SearchResult> searchResult = [
  SearchResult('assests/images/Rectangle 256.jpg', 'Apple', 'Kumili', 50, 35, 1,
      'fdsfds', 'nutirents', 'Fat', 'Vitamin', 85, 40, 30, Colors.white, true),
  SearchResult('assests/images/Rectangle 256.jpg', 'Apple', 'Kumili', 50, 35, 1,
      'dfsdf', 'nutirents', 'Fat', 'Vitamin', 85, 40, 30, Colors.white, false),
  SearchResult('assests/images/Rectangle 256.jpg', 'Apple', 'Kumili', 50, 35, 1,
      'dfsdf', 'nutirents', 'Fat', 'Vitamin', 85, 40, 30, Colors.white, false),
  SearchResult('assests/images/Rectangle 256.jpg', 'Apple', 'Kumili', 50, 35, 1,
      'dfsdf', 'nutirents', 'Fat', 'Vitamin', 85, 40, 30, Colors.white, false),
  SearchResult('assests/images/Rectangle 256.jpg', 'Apple', 'Kumili', 50, 35, 1,
      'dfsdf', 'nutirents', 'Fat', 'Vitamin', 85, 40, 30, Colors.white, true),
  SearchResult('assests/images/Rectangle 256.jpg', 'Apple', 'Kumili', 50, 35, 1,
      'dfsdf', 'nutirents', 'Fat', 'Vitamin', 85, 40, 30, Colors.white, true),
];
