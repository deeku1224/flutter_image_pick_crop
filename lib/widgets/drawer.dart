import 'dart:ui';
import 'drawerListTile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:flutter_image_pick_crop/modals/user.dart';
import 'package:flutter_image_pick_crop/screens/MyAccount.dart';
import 'package:flutter_image_pick_crop/screens/HistoryPage.dart';
import 'package:flutter_image_pick_crop/screens/home.dart';
import 'package:flutter_image_pick_crop/screens/privacyPolicy.dart';
import 'package:flutter_image_pick_crop/screens/termsAndConditions.dart';

import 'package:flutter_image_pick_crop/screens/notification.dart';
import 'package:flutter_image_pick_crop/screens/customerService.dart';

class DrawerStart extends StatelessWidget {
  final currentPage;

  const DrawerStart({Key key, this.currentPage}) : super(key: key);

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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 15),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assests/images/Group 42.png'))),
                  ),
                ),
                SizedBox(
                  height: 5,
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
                  padding: EdgeInsets.only(
                      left: 30, bottom: currentPage == 2 ? 8 : 10, top: 5),
                  child: DrawerListTile(
                    icon: Icon(
                      Icons.home,
                      color: Color(0xffFF2222),
                      size: 30,
                    ),
                    text: ' Home',
                    fontSize: currentPage == 1 ? 21 : 19,
                    fontWeight:
                        currentPage == 1 ? FontWeight.w600 : FontWeight.w200,
                    onPress: () {
                      Navigator.pushNamed(context, HomePage.id);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32, bottom: 0),
                  child: DrawerListTile(
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Color(0xffFF2222),
                    ),
                    text: 'My Orders',
                    fontSize: currentPage == 2 ? 21 : 19,
                    fontWeight:
                        currentPage == 2 ? FontWeight.w600 : FontWeight.w200,
                    onPress: () {
                      Navigator.pushNamed(context, HistoryPage.id);
                    },
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 0, bottom: 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, MyAccount.id);
                      },
                      child: Container(
                        height: 80,
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 15, left: 16),
                              child: SvgPicture.asset(
                                "assests/icons/My_Account_Icon.svg",
                                color: Colors.red,
                                height: 80,
                                width: 0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 104, top: currentPage == 3 ? 26.5 : 28),
                              child: Text(
                                'My Accounts',
                                style: TextStyle(
                                    color: Color(0xff3D3D3D),
                                    fontFamily: 'Inter',
                                    fontSize: currentPage == 3 ? 21 : 19,
                                    fontWeight: currentPage == 3
                                        ? FontWeight.w600
                                        : FontWeight.w200),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(
                      left: 32, bottom: currentPage == 5 ? 8 : 10),
                  child: DrawerListTile(
                    icon: Icon(
                      Icons.notifications_active,
                      color: Color(0xffFF2222),
                    ),
                    text: 'Notification',
                    fontSize: currentPage == 4 ? 21 : 19,
                    fontWeight:
                        currentPage == 4 ? FontWeight.w600 : FontWeight.w200,
                    onPress: () {
                      Navigator.pushNamed(context, Notifications.id);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 32, bottom: currentPage == 6 ? 8 : 10),
                  child: DrawerListTile(
                    icon: Icon(
                      Icons.favorite,
                      color: Color(0xffFF2222),
                    ),
                    text: 'Favourite',
                    fontSize: currentPage == 5 ? 21 : 19,
                    fontWeight:
                        currentPage == 5 ? FontWeight.w600 : FontWeight.w200,
                    onPress: () {
                      //
                    },
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
                  bottom: currentPage == 6 ? 28 : 30,
                  fontSize: currentPage == 6 ? 20 : 18,
                  fontWeight:
                      currentPage == 6 ? FontWeight.bold : FontWeight.normal,
                ),
                DrawerDownText(
                  onpress: () {
                    Navigator.pushNamed(context, TermsAndCondition.id);
                  },
                  text: 'Terms and Condition',
                  bottom: currentPage == 7 ? 28 : 30,
                  fontSize: currentPage == 7 ? 20 : 18,
                  fontWeight:
                      currentPage == 7 ? FontWeight.bold : FontWeight.normal,
                ),
                DrawerDownText(
                  onpress: () {
                    Navigator.pushNamed(context, CustomerService.id);
                  },
                  text: 'Customer Service',
                  bottom: currentPage == 8 ? 28 : 30,
                  fontSize: currentPage == 8 ? 20 : 18,
                  fontWeight:
                      currentPage == 8 ? FontWeight.bold : FontWeight.normal,
                ),
                DrawerDownText(
                  text: 'About Us',
                  bottom: currentPage == 9 ? 28 : 30,
                  fontSize: currentPage == 9 ? 20 : 18,
                  fontWeight:
                      currentPage == 9 ? FontWeight.bold : FontWeight.normal,
                ),
                DrawerDownText(
                  text: "FAQ's",
                  bottom: currentPage == 10 ? 28 : 30,
                  fontSize: currentPage == 10 ? 20 : 18,
                  fontWeight:
                      currentPage == 10 ? FontWeight.bold : FontWeight.normal,
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
    this.fontSize,
    this.fontWeight,
    this.bottom,
  }) : super(key: key);
  final String text;
  final Function onpress;
  final double fontSize, bottom;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onpress();
      },
      child: Padding(
        padding: EdgeInsets.only(left: 50, bottom: bottom),
        child: Text(
          text,
          style: TextStyle(
              color: Color(0xff4C4C4C),
              fontFamily: 'Inter',
              fontSize: fontSize,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}
