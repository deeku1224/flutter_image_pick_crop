import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/screens/bill.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/widgets/profile2Aligned.dart';
import 'package:flutter_image_pick_crop/widgets/nuniTextAligned.dart';
import 'package:flutter_image_pick_crop/widgets/accountAligned.dart';

class CheckOut extends StatefulWidget {
  static const String id = 'CheckOut';
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    double sum = 0;

    final total = [
      for (Product cartItem in cartItems)
        {
          setState(() {
            sum = sum + cartItem.price;
          })
        }
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
                      Positioned(
                        left: 135,
                        top: 115,
                        child: Text(
                          'Your Order',
                          style: TextStyle(
                              color: Color(0xff212121),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 29),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 180),
                        width: size.width,
                        height: 360,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cartItems.length,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Stack(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image:
                                            AssetImage(cartItems[index].image),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 140,
                                    child: Text(
                                      '${cartItems[index].name}',
                                      style: TextStyle(
                                        color: Color(0xff4D4D4D),
                                        fontFamily: 'OpenSans',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 40,
                                    left: 270,
                                    child: Consumer<MyCart>(
                                      builder: (context, myCart, child) => Text(
                                        'Rs.${cartItems[index].price}',
                                        style: TextStyle(
                                          color: Color(0xff4D4D4D),
                                          fontFamily: 'Roboto',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    left: 350,
                                    child: Consumer<MyCart>(
                                      builder: (context, myCart, child) =>
                                          IconButton(
                                        iconSize: 40,
                                        icon: SvgPicture.asset(
                                          'assests/icons/bi_trash.svg',
                                          height: 30,
                                          fit: BoxFit.cover,
                                        ),
                                        onPressed: () {
                                          myCart.removeAt(index);
                                          setState(() {
                                            cartItems.removeAt(index);
                                            sum = 0;

                                            cartItems.forEach((item) {
                                              sum = sum + item.price;
                                            });
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                      Positioned(
                        top: 580,
                        left: 90,
                        child: LoginButtonTextSize(
                          size: size,
                          fontSize: 21,
                          text: 'Place Order',
                          containercolour: Colors.black,
                          textcolour: Colors.white,
                          buttonVertical: size.height * 0.015,
                          buttonHoriz: size.width * 0.14,
                          press: () async {
                            Navigator.pushNamed(context, Bill.id);
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
                          image: AssetImage('assests/images/Frame.png'))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
