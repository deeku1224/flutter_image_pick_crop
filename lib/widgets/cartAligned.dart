import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/cartIcon.dart';

class CartAligned extends StatelessWidget {
  const CartAligned({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 345, top: 10),
      child: CartIcon(),
    );
  }
}
