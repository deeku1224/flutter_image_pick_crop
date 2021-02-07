import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/screens/historySinglePage.dart';

class HistoryPage extends StatefulWidget {
  static final String id = 'HistoryPage';
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
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
          endDrawer: DrawerCart(size: size, sum: sum),
          drawer: DrawerStart(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: Builder(builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.person,
                  size: 28,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
            actions: <Widget>[
              Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_active,
                        size: 28,
                      ),
                      onPressed: () {
                        // Navigatige to notification page
                      },
                    ),
                  );
                },
              ),
              Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    child: IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 28,
                      ),
                      onPressed: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          body: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
              ),
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Container(
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 30, right: 30, top: 20),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(top: 35),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, HistorySinglePage.id);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 136,
                                    width: 355,
                                    decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade400
                                                .withOpacity(0.5),
                                            spreadRadius: 10,
                                            blurRadius: 10,

                                            offset: Offset(0,
                                                5), // changes position of shadow
                                          ),
                                        ],
                                        color: Color(0xffFFADAD),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  Container(
                                    height: 136,
                                    width: 136,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFF7272),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 25, top: 30),
                                    child: Text(
                                      '14',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'SairaStencilOne',
                                          fontSize: 40),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 68, top: 43),
                                    child: Text(
                                      'Dec',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 70, top: 60),
                                    child: Text(
                                      'Sat',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 25, top: 85),
                                    child: Text(
                                      '2020',
                                      style: TextStyle(
                                          letterSpacing: 12,
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 160, top: 20),
                                    width: 170,
                                    height: 70,
                                    color: Colors.blue,
                                    child: Text(
                                      'hello',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: 108, left: 285),
                                    child: Text(
                                      '7 Items',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 12),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
