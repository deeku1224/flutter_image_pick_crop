import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/homeVegetables.dart';
import 'package:flutter_image_pick_crop/modals/favourites.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';

class HeartHomePage extends StatefulWidget {
  final product;

  const HeartHomePage({Key key, @required this.isFav, @required this.product})
      : super(key: key);

  final bool isFav;

  @override
  _HeartHomePageState createState() => _HeartHomePageState(isFav, product);
}

class _HeartHomePageState extends State<HeartHomePage> {
  bool isFav;
  Product product;
  _HeartHomePageState(this.isFav, this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isFav = !isFav;
            favouriteProduct.add(product);
            product.isFavourite = !product.isFavourite;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 207),
          padding: EdgeInsets.only(top: 4, left: 0),
          height: 47,
          width: 47,
          decoration: BoxDecoration(
              //borderRadius: isFav?BorderRadius.only(t)
              ),
          child: Stack(
            children: [
              Positioned(
                  top: 4,
                  left: 4.7,
                  child: Icon(Icons.favorite,
                      size: 36,
                      color: isFav ? Color(0xffFF0E0E) : Colors.transparent)),
              Icon(
                Icons.favorite_outline_sharp,
                size: 45,
                color: Colors.white,
              ),
            ],
          ),
        ));
    // child: isFav
    //     ? Icon(Icons.favorite, size: 35, color: Color(0xffFF0E0E))
    //     : Icon(
    //         Icons.favorite_outline_sharp,
    //         size: 43,
    //         color: Colors.white,
    //       )),
  }
}
