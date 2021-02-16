import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.only(right: 16),
        child: Badge(
          position: BadgePosition.topEnd(top: 0, end: 0),
          badgeColor: Colors.black,
          badgeContent: Consumer<MyCart>(
            builder: (context, myCart, child) => Text(
              myCart.cartItems.length.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ),
      );
    });
  }
}
