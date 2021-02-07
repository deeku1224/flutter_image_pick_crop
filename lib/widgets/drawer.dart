import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/user.dart';
import 'package:flutter_image_pick_crop/screens/MyAccount.dart';
import 'package:flutter_image_pick_crop/screens/HistoryPage.dart';
import 'package:flutter_image_pick_crop/screens/privacyPolicy.dart';
import 'package:flutter_image_pick_crop/screens/termsAndConditions.dart';

import 'package:flutter_image_pick_crop/screens/notification.dart';

import 'dart:ui';
import 'drawerListTile.dart';

class DrawerStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: Colors.white.withOpacity(
            0.6), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
      ),
      child: Drawer(
        elevation: 0,
        child: Stack(
          children: [
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Hello, ${user[0].name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 10, top: 5),
                  child: DrawerListTile(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Color(0xffFF2222),
                    ),
                    text: 'My Orders',
                    onPress: () {
                      Navigator.pushNamed(context, HistoryPage.id);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 10),
                  child: DrawerListTile(
                    onPress: () {
                      Navigator.pushNamed(context, MyAccount.id);
                    },
                    icon: Icon(
                      Icons.account_box_rounded,
                      color: Color(0xffFF2222),
                    ),
                    text: 'My Accounts',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 10),
                  child: DrawerListTile(
                    icon: Icon(
                      Icons.notifications_active,
                      color: Color(0xffFF2222),
                    ),
                    text: 'Notification',
                    onPress: () {
                      Navigator.pushNamed(context, Notifications.id);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 10),
                  child: DrawerListTile(
                    icon: Icon(
                      Icons.favorite,
                      color: Color(0xffFF2222),
                    ),
                    text: 'Favourite',
                    onPress: () {
                      //
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 30),
                  child: DrawerListTile(
                    icon: Icon(
                      Icons.av_timer_sharp,
                      color: Color(0xffFF2222),
                    ),
                    text: 'Buy Again',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: Color(0xffA3A3A3),
                    thickness: 2,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                DrawerDownText(
                  onpress: () {
                    Navigator.pushNamed(context, PrivacyPolicy.id);
                  },
                  text: 'Privacy Policy',
                ),
                DrawerDownText(
                  onpress: () {
                    Navigator.pushNamed(context, TermsAndCondition.id);
                  },
                  text: 'Terms and Condition',
                ),
                DrawerDownText(
                  text: 'Customer Service',
                ),
                DrawerDownText(
                  text: 'About Us',
                ),
                DrawerDownText(
                  text: "FAQ's",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerDownText extends StatelessWidget {
  const DrawerDownText({
    Key key,
    this.text,
    this.onpress,
  }) : super(key: key);
  final String text;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 50, bottom: 30),
        child: Text(
          text,
          style: TextStyle(
              color: Color(0xff4C4C4C), fontFamily: 'Inter', fontSize: 18),
        ),
      ),
    );
  }
}
