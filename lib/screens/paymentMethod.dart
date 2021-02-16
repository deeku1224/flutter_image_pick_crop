import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/orderSuccess.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/widgets/paymentOptionBox.dart';
import 'package:flutter_image_pick_crop/widgets/profile2Aligned.dart';
import 'package:flutter_image_pick_crop/widgets/nuniTextAligned.dart';
import 'package:flutter_image_pick_crop/widgets/accountAligned.dart';

class PaymentMethod extends StatefulWidget {
  static final String id = 'PaymentMethod';
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool cashondelivery = true;
  bool phonepe = false;
  bool googlePay = false;
  bool bHIM = false;
  bool debitCredit = false;
  @override
  Widget build(BuildContext context) {
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
                ),
                Positioned(
                  top: 208,
                  left: 156,
                  child: Text(
                    'Select Your',
                    style: TextStyle(
                        color: Color(0xff212121),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                Positioned(
                  left: 146,
                  top: 234,
                  child: Text(
                    'Payment',
                    style: TextStyle(
                        color: Color(0xff212121),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 29),
                  ),
                ),
                PaymentOptionBox(
                  color: cashondelivery ? Color(0xffFF1818) : Color(0xffC6C6C6),
                  press: () {
                    setState(() {
                      cashondelivery = true;
                      phonepe = false;
                      googlePay = false;
                      bHIM = false;
                      debitCredit = false;
                    });
                  },
                  imageHeight: 37,
                  imageWidth: 39,
                  top: 299,
                  text: 'Cash on delivery',
                  image: 'assests/images/pngegg (5) 1.jpg',
                ),
                PaymentOptionBox(
                  color: phonepe ? Color(0xffFF1818) : Color(0xffC6C6C6),
                  press: () {
                    setState(() {
                      cashondelivery = false;
                      phonepe = true;
                      googlePay = false;
                      bHIM = false;
                      debitCredit = false;
                    });
                  },
                  imageHeight: 38,
                  imageWidth: 38,
                  top: 379,
                  text: 'Phonepe',
                  image: 'assests/images/pngegg (2) 1.jpg',
                ),
                PaymentOptionBox(
                  color: googlePay ? Color(0xffFF1818) : Color(0xffC6C6C6),
                  press: () {
                    setState(() {
                      cashondelivery = false;
                      phonepe = false;
                      googlePay = true;
                      bHIM = false;
                      debitCredit = false;
                    });
                  },
                  imageHeight: 62,
                  imageWidth: 94,
                  top: 456,
                  text: 'Google Pay',
                  image: 'assests/images/pngegg (1) 1.jpg',
                ),
                PaymentOptionBox(
                  color: bHIM ? Color(0xffFF1818) : Color(0xffC6C6C6),
                  press: () {
                    setState(() {
                      cashondelivery = false;
                      phonepe = false;
                      googlePay = false;
                      bHIM = true;
                      debitCredit = false;
                    });
                  },
                  imageHeight: 32,
                  imageWidth: 42,
                  top: 534,
                  text: 'BHIM',
                  image: 'assests/images/pngegg (1) 3.jpg',
                ),
                PaymentOptionBox(
                  color: debitCredit ? Color(0xffFF1818) : Color(0xffC6C6C6),
                  press: () {
                    setState(() {
                      cashondelivery = false;
                      phonepe = false;
                      googlePay = false;
                      bHIM = false;
                      debitCredit = true;
                    });
                  },
                  imageHeight: 27,
                  imageWidth: 76,
                  top: 612,
                  text: 'Debit/Credit',
                  image: 'assests/images/pngegg (1) 2.jpg',
                ),
                Positioned(
                  top: 700,
                  left: 90,
                  child: LoginButtonTextSize(
                    size: size,
                    fontSize: 21,
                    text: 'Place Order',
                    containercolour: Colors.black,
                    textcolour: Colors.white,
                    buttonVertical: size.height * 0.015,
                    buttonHoriz: size.width * 0.14,
                    press: () {
                      Navigator.pushNamed(context, OrderSuccess.id);
                      // if (cashondelivery) {
                      //   //navigate to cod payment
                      // } else if (phonepe) {
                      //   //navigate to phone pe payment
                      // } else if (googlePay) {
                      //   //navigate to google pay payment
                      // } else if (bHIM) {
                      //   //navigate to BHIM payment
                      // } else if (debitCredit) {
                      //   //navigate to Debit/Credit payment
                      // }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 150, left: 50),
                  width: 320,
                  height: 60,
                  decoration: BoxDecoration(
                      //color: Colors.lightBlue,
                      image: DecorationImage(
                          image: AssetImage('assests/images/Group 37.png'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
