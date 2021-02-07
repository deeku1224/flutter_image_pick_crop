import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/modals/notification.dart';

import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';

class Notifications extends StatelessWidget {
  static const String id = 'Notification';

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
      drawer: DrawerStart(),
      endDrawer: DrawerCart(size: size, sum: sum),
      body: Stack(children: [
        Container(
          margin: EdgeInsets.only(top: 70),
          height: 702,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Padding(
            padding: EdgeInsets.only(
              top: 0,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: notifications.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 125,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 8,

                        offset: Offset(5, 10), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(top: 25, left: 50),
                    leading: Image(
                      image: AssetImage(notifications[index].image),
                    ),
                    title: Text(
                      notifications[index].primaryText,
                      style: TextStyle(
                          color: Color(0xff202020),
                          fontFamily: 'OpenSans',
                          fontSize: 18),
                    ),
                    subtitle: Text(
                      notifications[index].secondaryText,
                      style: TextStyle(
                          color: Color(0xff202020),
                          fontFamily: 'OpenSans',
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
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
        Container(
          margin: EdgeInsets.only(left: 10, top: 0),
          child: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Colors.white,
                iconSize: 32,
                icon: Icon(
                  Icons.person,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        //Notification icon
        Container(
          margin: EdgeInsets.only(left: 290, top: 0),
          child: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Colors.white,
                iconSize: 32,
                icon: Icon(
                  Icons.notifications_active,
                ),
                onPressed: () {
                  //Navigate to Notification Page
                },
              );
            },
          ),
        ),
        //Shopping Cart
        Container(
          margin: EdgeInsets.only(left: 345, top: 0),
          child: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Colors.white,
                iconSize: 32,
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ),
      ]),
    ));
  }
}
