import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/modals/notification.dart';
import 'package:flutter_image_pick_crop/widgets/searchAligned.dart';
import 'package:flutter_image_pick_crop/widgets/notificationAligned.dart';
import 'package:flutter_image_pick_crop/widgets/cartAligned.dart';
import 'package:flutter_image_pick_crop/widgets/profileAligned.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';

class Notifications extends StatelessWidget {
  final String navFrom;

  const Notifications({Key key, this.navFrom}) : super(key: key);

  Widget build(BuildContext context) {
    double sum = 0;

    final total = [
      for (Product cartItem in cartItems) {sum = sum + cartItem.price}
    ];
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => navFrom == 'icon' ? true : false,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        drawerScrimColor: Colors.transparent,
        drawer: DrawerStart(
          currentPage: 4,
        ),
        endDrawer: DrawerCart(size: size, sum: sum),
        body: Stack(children: [
          Container(
            margin: EdgeInsets.only(top: 70),
            height: 702,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: false,
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
          //Search
          SearchAligned(),
          //Notification icon
          NotificationAligned(),
          //Shopping Cart
          CartAligned()
        ]),
      )),
    );
  }
}
