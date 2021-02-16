import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/widgets/searchAligned.dart';
import 'package:flutter_image_pick_crop/widgets/notificationAligned.dart';
import 'package:flutter_image_pick_crop/widgets/cartAligned.dart';
import 'package:flutter_image_pick_crop/widgets/profileAligned.dart';

class CustomerService extends StatelessWidget {
  static const String id = 'CustomerService';
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
        currentPage: 7,
      ),
      endDrawer: DrawerCart(size: size, sum: sum),
      body: Stack(children: [
        GestureDetector(
          onTap: () {
            launch('tel://+918056905299');
          },
          child: Container(
            margin: EdgeInsets.only(top: 127, left: 57),
            height: 286,
            width: 300,
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey[300],
                      blurRadius: 10.0,
                      spreadRadius: 5,
                      offset: Offset(1, 10))
                ],
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.all(Radius.circular(13))),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 175,
                  width: 270,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage('assests/images/Rectangle 460.png'))),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Call Now',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 27,
                      color: Color(0xff757575)),
                ),
              ],
            ),
          ),
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
