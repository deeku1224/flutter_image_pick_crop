import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';

class MyOrderSingleList extends StatefulWidget {
  static const String id = 'MyOrderSingleList';
  @override
  _MyOrderSingleListState createState() => _MyOrderSingleListState();
}

class _MyOrderSingleListState extends State<MyOrderSingleList> {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawerScrimColor: Colors.transparent,
        drawer: DrawerStart(),
        endDrawer: DrawerCart(size: size, sum: sum),
        body: Container(
          height: size.height,
          width: size.width,
          child: ListView(children: [
            Stack(
              children: [
                Container(
                  height: 75,
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
                Positioned(
                  top: 125,
                  left: 30,
                  child: Text(
                    'Order Info',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 23),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 175, left: 30),
                  height: 99,
                  width: 360,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffF1F1F1), width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Stack(
                    children: [
                      Divider(
                        height: 87,
                        color: Color(0xffF1F1F1),
                        thickness: 5,
                      ),
                      Positioned(
                        top: 10,
                        left: 20,
                        child: Text(
                          'View Order Details',
                          style: TextStyle(
                              color: Color(0xff676767),
                              fontFamily: 'OpenSans',
                              fontSize: 14),
                        ),
                      ),
                      Positioned(
                        top: 57,
                        left: 20,
                        child: Text(
                          'Download Invoice',
                          style: TextStyle(
                              color: Color(0xff676767),
                              fontFamily: 'OpenSans',
                              fontSize: 14),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigate to order ddetails
                        },
                        child: Container(
                          height: 40,
                          width: 360,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //Navigate to Download Invoice
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 45),
                          height: 40,
                          width: 360,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 300,
                  left: 30,
                  child: Text(
                    'Delivery',
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 23),
                  ),
                ),
                //???need to change date
                Positioned(
                  top: 325,
                  left: 32,
                  child: Text(
                    'Delivered on 24/7/2020 ',
                    style: TextStyle(
                        color: Color(0xff959191),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 420),
                  height: 352,
                  width: size.width,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) => Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        child: Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10, bottom: 10),
                              child: Container(
                                height: 100,
                                width: 380,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade400
                                            .withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 12,

                                        offset: Offset(
                                            5, 5), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(cartItems[index].image),
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,
                              left: 280,
                              child: LoginButtonTextSize(
                                size: size,
                                text: 'View Details',
                                textcolour: Color(0xff929292),
                                containercolour: Color(0xffF0F0F0),
                                buttonHoriz: 10,
                                buttonVertical: 7,
                                press: () {
                                  //Navigate to view details
                                },
                                fontSize: 12,
                              ),
                            ),
                            Positioned(
                              top: 3,
                              left: 280,
                              child: LoginButtonTextSize(
                                size: size,
                                text: 'View Details',
                                textcolour: Color(0xff929292),
                                containercolour: Color(0xffF0F0F0),
                                buttonHoriz: 10,
                                buttonVertical: 7,
                                press: () {
                                  //Navigate to view details
                                },
                                fontSize: 12,
                              ),
                            ),
                            Positioned(
                              top: 48,
                              left: 280,
                              child: LoginButtonTextSize(
                                size: size,
                                text: 'Add to cart',
                                textcolour: Colors.white,
                                containercolour: Colors.black,
                                buttonHoriz: 13,
                                buttonVertical: 7,
                                press: () {
                                  //Navigate to Add To Cart
                                },
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, left: 30),
              child: Text(
                'Order Info',
                style: TextStyle(
                    color: Color(0xff000000),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 23),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: Container(
                margin: EdgeInsets.only(top: 25, left: 30),
                height: 99,
                width: 360,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffFFE9E9), width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Stack(
                  children: [
                    Divider(
                      height: 87,
                      color: Color(0xffFFE9E9),
                      thickness: 5,
                    ),
                    Positioned(
                      top: 10,
                      left: 20,
                      child: Text(
                        'Request Cancellation',
                        style: TextStyle(
                            color: Color(0xff676767),
                            fontFamily: 'OpenSans',
                            fontSize: 14),
                      ),
                    ),
                    Positioned(
                      top: 57,
                      left: 20,
                      child: Text(
                        'Raise Complaint',
                        style: TextStyle(
                            color: Color(0xff676767),
                            fontFamily: 'OpenSans',
                            fontSize: 14),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigate to order ddetails
                      },
                      child: Container(
                        height: 40,
                        width: 360,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //Navigate to Download Invoice
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 45),
                        height: 40,
                        width: 360,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ]),
        ),
      ),
    );
  }
}
