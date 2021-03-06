import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/widgets/searchAligned.dart';
import 'package:flutter_image_pick_crop/widgets/notificationAligned.dart';
import 'package:flutter_image_pick_crop/widgets/cartAligned.dart';
import 'package:flutter_image_pick_crop/widgets/profileAligned.dart';

class PrivacyPolicy extends StatelessWidget {
  static const String id = 'PrivacyPolicy';

  @override
  Widget build(BuildContext context) {
    double sum = 0;

    final total = [
      for (Product cartItem in cartItems) {sum = sum + cartItem.price}
    ];
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.transparent,
      drawer: DrawerStart(
        currentPage: 6,
      ),
      endDrawer: DrawerCart(size: size, sum: sum),
      body: Stack(children: [
        Positioned(
          top: 95,
          left: 110,
          child: Text(
            'Privacy Policy',
            style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 27),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 150),
          padding: EdgeInsets.symmetric(horizontal: 28),
          height: 585,
          width: 600,

          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim lobortis scelerisque fermentum dui faucibus in ornare quam viverra. At ultrices mi tempus imperdiet. Blandit massa enim nec dui nunc mattis enim ut tellus. Dictumst vestibulum rhoncus est pellentesque elit. A pellentesque sit amet porttitor eget dolor morbi. Mus mauris vitae ultricies leo integer malesuada nunc. Molestie a iaculis at erat pellentesque. Iaculis nunc sed augue lacus viverra vitae. Pretium quam vulputate dignissim suspendisse in. Adipiscing bibendum est ultricies integer quis auctor elit sed vulputate. Neque vitae tempus quam pellentesque nec nam aliquam. Sit amet dictum sit amet justo. Dui ut ornare lectus sit amet est placerat in. At imperdiet dui accumsan sit amet nulla. Massa sapien faucibus et molestie ac feugiat. Tempus urna et pharetra pharetra massa massa ultricies mi quis. Pharetra sit amet aliquam id diam maecenas. Aenean vel elit scelerisque mauris. Dignissim enim sit amet venenatis.',
              style: TextStyle(
                  letterSpacing: 0.005,
                  color: Color(0xff5C5C5C),
                  fontFamily: 'OpenSans',
                  fontSize: 17,
                  fontWeight: FontWeight.normal)),
          //gradient
        ),
        Container(
          height: 70,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xffFF0808),
                Color(0xffFFB199),
              ],
            ),
          ),
        ),
        //drawer opener person icon
        ProfileAligned(),
        //Searchicon
        SearchAligned(),
        //Notification icon
        NotificationAligned(),
        //Shopping Cart
        CartAligned()
      ]),
    ));
  }
}
