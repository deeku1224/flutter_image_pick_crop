import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/modals/searchResult.dart';
import 'package:flutter_image_pick_crop/modals/offerProduct.dart';
import 'package:flutter_image_pick_crop/widgets/nutrientBar.dart';
import 'package:flutter_image_pick_crop/widgets/searchResult.dart';

class SinglesPage extends StatefulWidget {
  final product;

  const SinglesPage({Key key, this.product}) : super(key: key);
  @override
  _SinglesPageState createState() => _SinglesPageState(product);
}

class _SinglesPageState extends State<SinglesPage> {
  final product;
  bool isFav = true;
  _SinglesPageState(this.product);

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
                  Stack(children: [
                    Container(
                      height: size.height,
                      width: size.width,
                      color: product.bgColor,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      height: 350,
                      width: size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                product.image,
                              ),
                              fit: BoxFit.contain)),
                    ),
                    Container(
                      height: 780,
                      width: size.width,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 345,
                          ),
                          Container(
                            child: Stack(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 30),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(50),
                                            topRight: Radius.circular(55))),
                                    child: Column(children: [
                                      Container(
                                          height: 470,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                top: 50,
                                                left: 40,
                                                child: Text(product.name,
                                                    style: TextStyle(
                                                      letterSpacing: 1.1,
                                                      color: Colors.black,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 33,
                                                    )),
                                              ),
                                              Positioned(
                                                top: 100,
                                                left: 44,
                                                child: Text(product.description,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'OpenSans',
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16,
                                                    )),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 190),
                                                child: NutrientBar(
                                                  text: product.p1,
                                                  percent: product.p1Percent,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 250),
                                                child: NutrientBar(
                                                  text: product.p2,
                                                  percent: product.p2Percent,
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 310),
                                                child: NutrientBar(
                                                  text: product.p3,
                                                  percent: product.p3Percent,
                                                ),
                                              ),
                                              Positioned(
                                                top: 400,
                                                left: 50,
                                                child: Text(
                                                  'Rs.${product.price.toString()}',
                                                  style: TextStyle(
                                                      color: Color(0xff181818),
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 30),
                                                ),
                                              ),
                                              Positioned(
                                                  top: 390,
                                                  left: 200,
                                                  child: LoginButtonTextSize(
                                                    size: size,
                                                    text: 'Add to Cart',
                                                    textcolour: Colors.white,
                                                    containercolour:
                                                        Colors.black,
                                                    buttonHoriz: 35,
                                                    buttonVertical: 14,
                                                    press: () {
                                                      //Add to Cart
                                                    },
                                                    fontSize: 18,
                                                  )),
                                            ],
                                          )),
                                      Container(
                                        margin: EdgeInsets.only(),
                                        padding: EdgeInsets.only(
                                          left: 15,
                                          right: 15,
                                        ),
                                        height: 680,
                                        width: size.width,
                                        child: GridView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: searchResult.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio: 0.9,
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 15.0,
                                                  mainAxisSpacing: 25.0),
                                          itemBuilder: (context, index) =>
                                              SearchResultContainers(
                                            onpress: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SinglesPage(
                                                              product:
                                                                  searchResult[
                                                                      index])));
                                            },
                                            resultIndex: searchResult[index],
                                          ),
                                        ),
                                      ),
                                    ])),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFav = !isFav;
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(top: 0, left: 50),
                                    padding: EdgeInsets.only(top: 4, left: 0),
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      size: 45,
                                      color: isFav
                                          ? Color(0xffFF0E0E)
                                          : Color(0xffC7C7C7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     setState(() {
                    //       isFav = !isFav;
                    //     });
                    //   },
                    //   child: Container(
                    //     margin: EdgeInsets.only(top: 0, left: 80),
                    //     padding: EdgeInsets.only(top: 4, left: 0),
                    //     height: 65,
                    //     width: 65,
                    //     decoration: BoxDecoration(
                    //       color: Colors.white,
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: Icon(
                    //       Icons.favorite,
                    //       size: 45,
                    //       color: isFav ? Color(0xffFF0E0E) : Color(0xffC7C7C7),
                    //     ),
                    //   ),
                    //   // child: Container(
                    //   //   height: 100,
                    //   //   width: 100,
                    //   //   color: isFav
                    //   //       ? Colors.red
                    //   //       : Colors.grey,
                    // ),

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
                ]))));
  }
}
