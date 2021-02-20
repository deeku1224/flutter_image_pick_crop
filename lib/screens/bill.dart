import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/screens/paymentMethod.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/widgets/profile2Aligned.dart';
import 'package:flutter_image_pick_crop/widgets/nuniTextAligned.dart';
import 'package:flutter_image_pick_crop/widgets/accountAligned.dart';

class Bill extends StatelessWidget {
  static const String id = 'Bill';

  @override
  Widget build(BuildContext context) {
    DateTime.now().add(Duration(minutes: 30));

    double sum = 0;

    final total = [
      for (Product cartItem in cartItems) {sum = sum + cartItem.price}
    ];
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xffFF0808),
            Color(0xffFFB199),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawerScrimColor: Colors.transparent,
          drawer: DrawerStart(),
          body: Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Profile2Aligned(),
                NuniTextAligned(),
                AccountAligned(),
                Container(
                  margin: EdgeInsets.only(top: 115),
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(55),
                      topLeft: Radius.circular(55),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 120, left: 24),
                        height: 412,
                        width: 367,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400.withOpacity(0.5),
                              spreadRadius: 10,
                              blurRadius: 10,

                              offset:
                                  Offset(0, 5), // changes position of shadow
                            ),
                          ],
                          color: Color(0xffF5F5F5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 120, left: 24),
                        height: 339,
                        width: 367,
                        decoration: BoxDecoration(
                          color: Color(0xffFF5454),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 165, left: 44),
                        height: 125,
                        width: 324,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      //shipping to
                      Positioned(
                        top: 195,
                        left: 75,
                        child: Text(
                          'Shipping to :',
                          style: TextStyle(
                              color: Color(0xff595959),
                              fontFamily: 'OpenSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      //area , salem
                      Positioned(
                        top: 195,
                        left: 205,
                        child: Container(
                          height: 25,
                          width: 160,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              '5-Roads,Salem',
                              style: TextStyle(
                                  color: Color(0xff060606),
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      //Arive At
                      Positioned(
                        top: 235,
                        left: 75,
                        child: Text(
                          'Arrives at    :',
                          style: TextStyle(
                              color: Color(0xff595959),
                              fontFamily: 'OpenSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      //time
                      Positioned(
                        top: 235,
                        left: 255,
                        child: Text(
                          '${DateFormat("h:mma").format(DateTime.now().add(Duration(minutes: 30)))}',
                          style: TextStyle(
                              color: Color(0xff1DA13B),
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      //items
                      Positioned(
                        top: 325,
                        left: 75,
                        child: Text(
                          'Items      :',
                          style: TextStyle(
                              color: Color(0xffFFFEFE),
                              fontFamily: 'OpenSans',
                              fontSize: 21,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      //total digits
                      Positioned(
                        top: 328,
                        left: 260,
                        child: Text(
                          'Rs.$sum',
                          style: TextStyle(
                              color: Color(0xffFFFEFE),
                              fontFamily: 'Roboto',
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        ),
                      ),

                      //Delivery
                      Positioned(
                        top: 375,
                        left: 75,
                        child: Text(
                          'Delivery  :',
                          style: TextStyle(
                              color: Color(0xffFFFEFE),
                              fontFamily: 'OpenSans',
                              fontSize: 21,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      //Delivery Cost
                      Positioned(
                        top: 382,
                        left: 260,
                        child: Text(
                          'Rs.0.0',
                          style: TextStyle(
                              color: Color(0xffFFFEFE),
                              fontFamily: 'Roboto',
                              fontSize: 21,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      //Total Text
                      Positioned(
                        top: 480,
                        left: 75,
                        child: Text(
                          'Total  :',
                          style: TextStyle(
                              color: Color(0xff000000),
                              fontFamily: 'OpenSans',
                              fontSize: 21,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      //Total Amount
                      Positioned(
                        top: 478,
                        left: 255,
                        child: Text(
                          'Rs.$sum',
                          style: TextStyle(
                              color: Color(0xffFF1818),
                              fontFamily: 'Roboto',
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Proceed Button
                      Positioned(
                        top: 580,
                        left: 80,
                        child: LoginButtonTextSize(
                          size: size,
                          fontSize: 21,
                          text: 'Proceed',
                          containercolour: Colors.black,
                          textcolour: Colors.white,
                          buttonVertical: size.height * 0.019,
                          buttonHoriz: size.width * 0.2,
                          press: () {
                            Navigator.pushNamed(context, PaymentMethod.id);
                            //navigate to next page
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150, left: 50),
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                      //color: Colors.lightBlue,
                      image: DecorationImage(
                          image: AssetImage('assests/images/Group 36.png'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
