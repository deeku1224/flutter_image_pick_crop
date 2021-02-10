import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_pick_crop/screens/checkOut.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_image_pick_crop/modals/offerProduct.dart';
import 'package:flutter_image_pick_crop/modals/homeVegetables.dart';
import 'package:flutter_image_pick_crop/modals/diaryProduct.dart';
import 'package:flutter_image_pick_crop/modals/featuredProduct.dart';
import 'package:flutter_image_pick_crop/modals/productNameHome.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/modals/user.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/offerCarusel.dart';
import 'package:flutter_image_pick_crop/modals/homeNonVeg.dart';
import 'package:flutter_image_pick_crop/modals/homeFruits.dart';
import 'package:flutter_image_pick_crop/screens/singlesPage.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:badges/badges.dart';
import 'package:flutter_image_pick_crop/widgets/featuredTag.dart';
import 'package:flutter_image_pick_crop/widgets/blurredSmallContainer.dart';

class HomePage extends StatefulWidget {
  static const String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentOffer = 0;
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double sum = 0;

    final total = [
      for (Product cartItem in cartItems) {sum = sum + cartItem.price}
    ];

    // ignore: unused_local_variable
    double vegetableIndex = 0;
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
          drawerScrimColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          endDrawer: Theme(
            data: Theme.of(context).copyWith(
              // Set the transparency here
              canvasColor: Colors.grey.shade100.withOpacity(
                  0.5), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
            ),
            child: Container(
              width: 90,
              child: Drawer(
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 40,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Container(
                                height: size.height * 0.74,
                                color: Colors.transparent,
                                child: ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: cartItems.length,
                                    // itemCount: cartItems.length,
                                    itemBuilder: (context, index) => Padding(
                                          padding: EdgeInsets.only(
                                              top: 7.5, bottom: 8),
                                          child: Stack(
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            cartItems[index]
                                                                .image),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 18),
                                                    child: Text(
                                                        'Rs.${cartItems[index].price}'),
                                                  )
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 50),
                                                child: IconButton(
                                                  icon: Icon(
                                                    Icons.remove_circle,
                                                  ),
                                                  onPressed: () {
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
                                            ],
                                          ),
                                        )

                                    // CartItemDisplayer(
                                    //   index: index,
                                    // ),
                                    ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 652),
                            height: 120,
                            width: double.infinity,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Divider(
                                  color: Color(0xff939393),
                                  height: 0,
                                  thickness: 3,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text('${cartItems.length.toString()} items'),
                                Text(
                                  'Rs.$sum',
                                  style: TextStyle(
                                      color: Color(0xff3C3C3C),
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                LoginButtonTextSize(
                                  size: size,
                                  text: 'GO!',
                                  textcolour: Colors.white,
                                  containercolour: Color(0xffFF0D0D),
                                  buttonHoriz: 0,
                                  buttonVertical: 0,
                                  press: () async {
                                    await Navigator.pushNamed(
                                        context, CheckOut.id);
                                  },
                                  fontSize: 14,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          drawer: DrawerStart(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: Builder(builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.person,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              }),
              actions: <Widget>[
                Builder(builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_active,
                        size: 25,
                      ),
                      onPressed: () {
                        // Navigatige to notification page
                      },
                    ),
                  );
                }),
                Builder(builder: (BuildContext context) {
                  return Container(
                    //margin: EdgeInsets.only(right: 32),
                    child: Badge(
                      position: BadgePosition.topEnd(top: 0, end: 0),
                      badgeColor: Colors.black,
                      badgeContent: Text(
                        cartItems.length.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 25,
                        ),
                        onPressed: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          body: Stack(
            children: [
              //container to give back ground white
              Container(
                height: size.height,
                width: size.width,
                color: Colors.white,
              ),
              ListView(
                physics: ScrollPhysics(),
                children: [
                  //app bar animation down part
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xffFF0808),
                          Color(0xffFFB199),
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(60),
                        bottomRight: Radius.circular(60),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 70, top: 10),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hey ',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 21,
                                  ),
                                ),
                                TextSpan(
                                  text: '${user[0].name},\n',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21,
                                  ),
                                ),
                                TextSpan(
                                  text: "Let's eat Quality food",
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 21,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 315, bottom: 20),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assests/images/Ellipse 35.png'),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                        // Container(
                        //   height: 30,
                        //   width: 200,
                        //   color: Colors.white,
                        // )
                      ],
                    ),
                  ),
                  //starting circle
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 70,
                    width: double.infinity,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: productNameHome.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 13),
                            height: 50,
                            width: 50,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage(productNameHome[index].image),
                            ),
                          ),
                          Text(
                            productNameHome[index].name,
                            style: TextStyle(
                                fontFamily: 'OpenSans',
                                fontSize: 13,
                                color: Color(0xff818181)),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //carosel product offers
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: CarouselSlider(
                      autoPlay: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayInterval: Duration(seconds: 3),
                      pauseAutoPlayOnTouch: Duration(seconds: 6),
                      aspectRatio: 1,
                      initialPage: 0,
                      onPageChanged: (index) {
                        setState(() {
                          currentOffer = index;
                        });
                      },
                      items: imglist.map((imgUrl) {
                        return Builder(builder: (BuildContext context) {
                          return Stack(
                            children: [
                              Container(
                                height: 200,
                                width: size.width,
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                child: Image.asset(
                                  imgUrl,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Positioned(
                                left: 270,
                                top: 20,
                                child: Text(
                                  '${(currentOffer + 1).toString()}/${imglist.length}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontSize: 15),
                                ),
                              )
                            ],
                          );
                        });
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  //offers banner
                  Container(
                    height: 60,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assests/images/Component 8.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //offers card
                  OfferCard(
                    product: offerProduct,
                  ),
                  //Featured tag
                  FeaturedTag(
                    size: size,
                    width: 220,
                    text: 'Featured',
                    onPress: () {
                      //Navigate to show all
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //offer card
                  OfferCard(
                    product: featuredProduct,
                  ),
                  FeaturedTag(
                    size: size,
                    width: 260,
                    text: 'Diary',
                    onPress: () {
                      //Navigate to show all
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //offer card
                  OfferCard(
                    product: diaryProduct,
                  ),
                  //home Vegetables
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assests/images/Rectangle 804 (1).png'),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                              top: 115,
                              left: 20,
                            ),
                            child: Text(
                              'Vegetables',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600),
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            top: 155,
                            left: 20,
                          ),
                          child: Text(
                            'Lorem ipsum dolor sit amet,\nconsectetur t labore et dolore\nmagna aliqua Ut.',
                            style: TextStyle(
                                color: Color(0xff5C5C5C),
                                fontFamily: 'OpenSans',
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 270),
                          child: Container(
                            height: 500,
                            width: double.infinity,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: vegetables.length,
                              itemBuilder: (context, index) => Container(
                                padding: EdgeInsets.only(left: 22, right: 27),
                                child: Stack(
                                  children: [
                                    //blurbig Containeer
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4.0, sigmaY: 4),
                                        child: Container(
                                          height: 430,
                                          width: 275,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade400
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 430,
                                      width: 275,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assests/images/Rectangle 475.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                    //vegetable image
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SinglesPage(
                                                        isFav: vegetables[index]
                                                            .isFavourite,
                                                        product: vegetables[
                                                            index])));
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 55, top: 90),
                                        height: 180,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  vegetables[index].image),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    HeartHomePage(
                                        product: vegetables[index].isFavourite,
                                        isFav: vegetables[index].isFavourite),
                                    //vegetable name
                                    Positioned(
                                      top: 250,
                                      left: 50,
                                      child: Text(
                                        vegetables[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
                                      ),
                                    ),
                                    //favourite

                                    //vegetable price
                                    Positioned(
                                      top: 305,
                                      left: 130,
                                      child: Text(
                                        'Rs.${vegetables[index].price}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 27),
                                      ),
                                    ),
                                    //add to cart
                                    Positioned(
                                      top: 393,
                                      left: 60,
                                      child: LoginButtonTextSize(
                                        size: size,
                                        text: 'Add to Cart',
                                        textcolour: Colors.white,
                                        containercolour: Color(0xff2C2C2C),
                                        buttonHoriz: 40,
                                        buttonVertical: 15,
                                        press: () {
                                          setState(() {
                                            cartItems.add(vegetables[index]);
                                            cartItems.forEach((item) {
                                              sum = 0;
                                              sum = sum + item.price;
                                            });
                                          }); //take id and send
                                        },
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 780, left: 39),
                          child: GestureDetector(
                            onTap: () {
                              //Navigate to Show All
                            },
                            child: Text(
                              'Show all    >',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontFamily: 'OpenSans',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // HomeDownPages(
                  //   sum: sum,
                  //   size: size,
                  //   product: vegetables,
                  //   bgimage: 'assests/images/Rectangle 804 (1).png',
                  //   topic: 'Vegetables',
                  //   topicText:
                  //       'Lorem ipsum dolor sit amet,\nconsectetur t labore et dolore\nmagna aliqua Ut.',
                  //   itemcount: vegetables.length,
                  // ),
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assests/images/home-Non-veg (1) 1.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                              top: 115,
                              left: 20,
                            ),
                            child: Text(
                              'Non-Veg',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600),
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            top: 155,
                            left: 20,
                          ),
                          child: Text(
                            'Lorem ipsum dolor sit amet,\nconsectetur t labore et dolore\nmagna aliqua Ut.',
                            style: TextStyle(
                                color: Color(0xff5C5C5C),
                                fontFamily: 'OpenSans',
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 270),
                          child: Container(
                            height: 500,
                            width: double.infinity,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: homeNonVeg.length,
                              itemBuilder: (context, index) => Container(
                                padding: EdgeInsets.only(left: 22, right: 27),
                                child: Stack(
                                  children: [
                                    // blurbig Containeer
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4.0, sigmaY: 4),
                                        child: Container(
                                          height: 430,
                                          width: 275,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade400
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 430,
                                      width: 275,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assests/images/Rectangle 475.png'),
                                              fit: BoxFit.fill)),
                                    ),

                                    //vegetable image
                                    GestureDetector(
                                      onTap: () async {
                                        // refreshKey.currentState.show();
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SinglesPage(
                                                        isFav: homeNonVeg[index]
                                                            .isFavourite,
                                                        product: homeNonVeg[
                                                            index])));
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 55, top: 90),
                                        height: 180,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  homeNonVeg[index].image),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    //heart
                                    HeartHomePage(
                                        product: homeNonVeg[index].isFavourite,
                                        isFav: homeNonVeg[index].isFavourite),
                                    //vegetable name
                                    Positioned(
                                      top: 250,
                                      left: 50,
                                      child: Text(
                                        homeNonVeg[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
                                      ),
                                    ),
                                    //vegetable price
                                    Positioned(
                                      top: 305,
                                      left: 130,
                                      child: Text(
                                        'Rs.${homeNonVeg[index].price}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 27),
                                      ),
                                    ),
                                    //add to cart
                                    Positioned(
                                      top: 393,
                                      left: 60,
                                      child: LoginButtonTextSize(
                                        size: size,
                                        text: 'Add to Cart',
                                        textcolour: Colors.white,
                                        containercolour: Color(0xff2C2C2C),
                                        buttonHoriz: 40,
                                        buttonVertical: 15,
                                        press: () {
                                          setState(() {
                                            cartItems.add(homeNonVeg[index]);
                                            cartItems.forEach((item) {
                                              sum = 0;
                                              sum = sum + item.price;
                                            });
                                          }); //take id and send
                                        },
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 780, left: 39),
                          child: GestureDetector(
                            onTap: () {
                              //Navigate to Show All
                            },
                            child: Text(
                              'Show all    >',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontFamily: 'OpenSans',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // HomeDownPages(
                  //   sum: sum,
                  //   size: size,
                  //   product: homeNonVeg,
                  //   bgimage: 'assests/images/home-Non-veg (1) 1.png',
                  //   topic: 'Non-Veg',
                  //   topicText:
                  //       'Lorem ipsum dolor sit amet,\nconsectetur t labore et dolore\nmagna aliqua Ut.',
                  //   itemcount: homeNonVeg.length,
                  // ),
                  Container(
                    height: size.height,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assests/images/home-fruit.png'),
                          fit: BoxFit.fill),
                    ),
                    child: Stack(
                      children: [
                        Container(
                            padding: EdgeInsets.only(
                              top: 115,
                              left: 20,
                            ),
                            child: Text(
                              'Fruits',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 32,
                                  fontWeight: FontWeight.w600),
                            )),
                        Container(
                          padding: EdgeInsets.only(
                            top: 155,
                            left: 20,
                          ),
                          child: Text(
                            'Lorem ipsum dolor sit amet,\nconsectetur t labore et dolore\nmagna aliqua Ut.',
                            style: TextStyle(
                                color: Color(0xff5C5C5C),
                                fontFamily: 'OpenSans',
                                fontSize: 18,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 270),
                          child: Container(
                            height: 500,
                            width: double.infinity,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: homeFruits.length,
                              itemBuilder: (context, index) => Container(
                                padding: EdgeInsets.only(left: 22, right: 27),
                                child: Stack(
                                  children: [
                                    //blurbig Containeer
                                    ClipRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 4, sigmaY: 4),
                                        child: Container(
                                          height: 430,
                                          width: 275,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade400
                                                  .withOpacity(0.5),
                                              borderRadius:
                                                  BorderRadius.circular(40)),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 430,
                                      width: 275,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assests/images/Rectangle 475.png'),
                                              fit: BoxFit.fill)),
                                    ),
                                    //vegetable image
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SinglesPage(
                                                        isFav: homeFruits[index]
                                                            .isFavourite,
                                                        product: homeFruits[
                                                            index])));
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(left: 55, top: 90),
                                        height: 180,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  homeFruits[index].image),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                    ),
                                    //Heart
                                    HeartHomePage(
                                        product: homeFruits[index].isFavourite,
                                        isFav: homeFruits[index].isFavourite),
                                    //vegetable name
                                    Positioned(
                                      top: 250,
                                      left: 50,
                                      child: Text(
                                        homeFruits[index].name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
                                      ),
                                    ),
                                    //vegetable price
                                    Positioned(
                                      top: 305,
                                      left: 130,
                                      child: Text(
                                        'Rs.${homeFruits[index].price}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.w500,
                                            fontSize: 27),
                                      ),
                                    ),
                                    //add to cart
                                    Positioned(
                                      top: 393,
                                      left: 60,
                                      child: LoginButtonTextSize(
                                        size: size,
                                        text: 'Add to Cart',
                                        textcolour: Colors.white,
                                        containercolour: Color(0xff2C2C2C),
                                        buttonHoriz: 40,
                                        buttonVertical: 15,
                                        press: () {
                                          setState(() {
                                            cartItems.add(homeFruits[index]);
                                            cartItems.forEach((item) {
                                              sum = 0;
                                              sum = sum + item.price;
                                            });
                                          }); //take id and send
                                        },
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 780, left: 39),
                          child: GestureDetector(
                            onTap: () {
                              //Navigate to Show All
                            },
                            child: Text(
                              'Show all    >',
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontFamily: 'OpenSans',
                                  fontSize: 21,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  // HomeDownPages(
                  //   size: size,
                  //   product: homeFruits,
                  //   bgimage: 'assests/images/home-fruit.png',
                  //   topic: 'Fruits',
                  //   topicText:
                  //       'Lorem ipsum dolor sit amet,\nconsectetur t labore et dolore\nmagna aliqua Ut.',
                  //   itemcount: homeFruits.length,
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeartHomePage extends StatefulWidget {
  final product;

  const HeartHomePage({Key key, @required this.isFav, @required this.product})
      : super(key: key);

  final bool isFav;

  @override
  _HeartHomePageState createState() => _HeartHomePageState(isFav, product);
}

class _HeartHomePageState extends State<HeartHomePage> {
  bool isFav;
  final product;
  _HeartHomePageState(this.isFav, this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isFav = !isFav;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 207),
          padding: EdgeInsets.only(top: 4, left: 0),
          height: 47,
          width: 47,
          decoration: BoxDecoration(
              //borderRadius: isFav?BorderRadius.only(t)
              ),
          child: Stack(
            children: [
              Positioned(
                  top: 4,
                  left: 4.7,
                  child: Icon(Icons.favorite,
                      size: 36,
                      color: isFav ? Color(0xffFF0E0E) : Colors.transparent)),
              Icon(
                Icons.favorite_outline_sharp,
                size: 45,
                color: Colors.white,
              ),
            ],
          ),
        ));
    // child: isFav
    //     ? Icon(Icons.favorite, size: 35, color: Color(0xffFF0E0E))
    //     : Icon(
    //         Icons.favorite_outline_sharp,
    //         size: 43,
    //         color: Colors.white,
    //       )),
  }
}

class OfferCard extends StatelessWidget {
  final product;
  const OfferCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: featuredProduct.length,
        itemBuilder: (context, index) => BlurredSmallContainer(
          onPress: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SinglesPage(
                        isFav: product[index].isFavourite,
                        product: product[index])));
          },
          index: index,
          name: product[index].name,
          image: product[index].image,
          price: product[index].price,
        ),
      ),
    );
  }
}

// SliverAppBar createSilverAppBar() {
//   final TextEditingController _filter = TextEditingController();
//   bool isSearchClicked = false;
//   return SliverAppBar(
//     shadowColor: Colors.transparent,
//     backgroundColor: Colors.transparent,
//     leading: Builder(
//       builder: (context) {
//         return IconButton(
//           icon: Icon(
//             Icons.person,
//           ),
//           onPressed: () {
//             Scaffold.of(context).openDrawer();
//           },
//         );
//       },
//     ),
//     actions: <Widget>[
//       Builder(
//         builder: (context) {
//           return Container(
//             margin: EdgeInsets.only(right: 15),
//             child: IconButton(
//               icon: Icon(
//                 Icons.notifications_active,
//                 size: 25,
//               ),
//               onPressed: () {
//                 // Navigatige to notification page
//               },
//             ),
//           );
//         },
//       ),
//       Builder(
//         builder: (context) {
//           return Container(
//             margin: EdgeInsets.only(right: 32),
//             child: IconButton(
//               icon: Icon(
//                 Icons.shopping_cart,
//                 size: 25,
//               ),
//               onPressed: () {
//                 Scaffold.of(context).openEndDrawer();
//               },
//             ),
//           );
//         },
//       ),
//     ],
//     expandedHeight: 220,
//     floating: false,
//     pinned: true,
//     flexibleSpace: FlexibleSpaceBar(
//       centerTitle: true,
//       title: Container(
//         height: 30,
//         width: 170,
//         color: Colors.white,
//       ),
//       background: Container(
//         height: 120,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.topRight,
//             colors: [
//               Color(0xffFF0808),
//               Color(0xffFFB199),
//             ],
//           ),
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(60),
//             bottomRight: Radius.circular(60),
//           ),
//         ),
//         child: Stack(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 70, top: 60),
//               child: RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'Hey ',
//                       style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w400,
//                         fontSize: 21,
//                       ),
//                     ),
//                     TextSpan(
//                       text: '${user[0].name},\n',
//                       style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 21,
//                       ),
//                     ),
//                     TextSpan(
//                       text: "Let's eat Quality food",
//                       style: TextStyle(
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w600,
//                         fontSize: 21,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 315, top: 50),
//               height: 60,
//               width: 60,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage('assests/images/Ellipse 35.png'),
//                   fit: BoxFit.fill,
//                 ),
//                 shape: BoxShape.circle,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// import 'package:flutter/material.dart';
// import 'dart:ui';
// import 'package:flutter_image_pick_crop/widgets/drawer.dart';
// import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
// import 'package:flutter_image_pick_crop/modals/cart.dart';
// import 'package:flutter_image_pick_crop/modals/user.dart';
// import 'package:flutter/cupertino.dart';

// class HomePage extends StatefulWidget {
//   static const String id = 'HomePage';
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Icon _searchIcon = Icon(
//     Icons.search,
//   );

//   @override
//   Widget build(BuildContext context) {
//     bool isSearchClicked = false;

//     Size size = MediaQuery.of(context).size;

//     double sum = 0;

//     final total = [
//       for (CartItem cartItem in cartItems)
//         {
//           setState(() {
//             sum = sum + cartItem.price;
//           })
//         }
//     ];
//     // ignore: unused_local_variable

//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.topRight,
//           colors: [
//             Color(0xffFF0808),
//             Color(0xffFFB199),
//           ],
//         ),
//       ),
//       child: SafeArea(
//         child: Scaffold(
//             body: NestedScrollView(
//           headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
//             return <Widget>[createSilverAppBar()];
//           },
//           // drawerScrimColor: Colors.transparent,
//           // backgroundColor: Colors.transparent,
//           // appBar: PreferredSize(
//           //   preferredSize: Size.fromHeight(70.0),
//           //   child: AppBar(
//           //     elevation: 0,
//           //     backgroundColor: Colors.transparent,
//           //     leading: Builder(
//           //       builder: (context) {
//           //         return IconButton(
//           //           icon: Icon(
//           //             Icons.person,
//           //           ),
//           //           onPressed: () {
//           //             Scaffold.of(context).openDrawer();
//           //           },
//           //         );
//           //       },
//           //     ),
//           //     actions: <Widget>[
//           //       Builder(
//           //         builder: (context) {
//           //           return Container(
//           //             margin: EdgeInsets.only(right: 15),
//           //             child: IconButton(
//           //               icon: Icon(
//           //                 Icons.notifications_active,
//           //                 size: 25,
//           //               ),
//           //               onPressed: () {
//           //                 // Navigatige to notification page
//           //               },
//           //             ),
//           //           );
//           //         },
//           //       ),
//           //       Builder(
//           //         builder: (context) {
//           //           return Container(
//           //             margin: EdgeInsets.only(right: 32),
//           //             child: IconButton(
//           //               icon: Icon(
//           //                 Icons.shopping_cart,
//           //                 size: 25,
//           //               ),
//           //               onPressed: () {
//           //                 Scaffold.of(context).openEndDrawer();
//           //               },
//           //             ),
//           //           );
//           //         },
//           //       ),
//           //     ],
//           //   ),
//           // ),
//           // drawer: DrawerStart(),
//           // endDrawer: DrawerCart(size: size, sum: sum),
//           body: Stack(
//             children: [
//               Container(
//                 height: size.height,
//                 width: size.width,
//                 color: Colors.white,
//               ),
//               SingleChildScrollView(
//                 physics: ScrollPhysics(),
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 120,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.topRight,
//                           colors: [
//                             Color(0xffFF0808),
//                             Color(0xffFFB199),
//                           ],
//                         ),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(60),
//                           bottomRight: Radius.circular(60),
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.only(left: 70, top: 10),
//                             child: RichText(
//                               text: TextSpan(
//                                 children: [
//                                   TextSpan(
//                                     text: 'Hey ',
//                                     style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w400,
//                                       fontSize: 21,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: '${user[0].name},\n',
//                                     style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 21,
//                                     ),
//                                   ),
//                                   TextSpan(
//                                     text: "Let's eat Quality food",
//                                     style: TextStyle(
//                                       fontFamily: 'Inter',
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 21,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 315, bottom: 20),
//                             height: 60,
//                             width: 60,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image:
//                                     AssetImage('assests/images/Ellipse 35.png'),
//                                 fit: BoxFit.fill,
//                               ),
//                               shape: BoxShape.circle,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

// SliverAppBar createSilverAppBar() {
//   final TextEditingController _filter = TextEditingController();
//   bool isSearchClicked = false;
//   return SliverAppBar(
//     actions: <Widget>[
//       RawMaterialButton(
//         elevation: 0.0,
//         child: Icon(
//           Icons.search,
//         ),
//         onPressed: () {
//           //
//         },
//         constraints: BoxConstraints.tightFor(
//           width: 56,
//           height: 56,
//         ),
//         shape: CircleBorder(),
//       ),
//     ],
//     expandedHeight: 300,
//     floating: false,
//     pinned: true,
//     flexibleSpace: FlexibleSpaceBar(
//         titlePadding: EdgeInsets.only(bottom: 15),
//         centerTitle: true,
//         title: isSearchClicked
//             ? Container(
//                 padding: EdgeInsets.only(bottom: 2),
//                 constraints: BoxConstraints(minHeight: 40, maxHeight: 40),
//                 width: 220,
//                 child: CupertinoTextField(
//                   controller: _filter,
//                   keyboardType: TextInputType.text,
//                   placeholder: "Search..",
//                   placeholderStyle: TextStyle(
//                     color: Color(0xffC4C6CC),
//                     fontSize: 14.0,
//                     fontFamily: 'Brutal',
//                   ),
//                   prefix: Padding(
//                     padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
//                     child: Icon(
//                       Icons.search,
//                     ),
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     color: Colors.white,
//                   ),
//                 ),
//               )
//             : Text("Tutorial"),
//         background: Image.network(
//           "https://miro.medium.com/max/3240/1*9-ujy3CCBhrpkvS7TMLcoQ.png",
//           fit: BoxFit.cover,
//         )),
//   );

// class SinglesPage extends StatefulWidget {
//   final product;
//   final bool isFav;
//   const SinglesPage({
//     Key key,
//     this.product,
//     this.isFav,
//   }) : super(key: key);
//   @override
//   _SinglesPageState createState() => _SinglesPageState(product, isFav);
// }

// class _SinglesPageState extends State<SinglesPage> {
//   final product;
//   bool isFav;
//   _SinglesPageState(this.product, this.isFav);

//   @override
//   Widget build(BuildContext context) {
//     double sum = 0;

//     final total = [
//       for (Product cartItem in cartItems) {sum = sum + cartItem.price}
//     ];
//     Size size = MediaQuery.of(context).size;
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: Colors.white,
//             drawerScrimColor: Colors.transparent,
//             drawer: DrawerStart(),
//             endDrawer: DrawerCart(size: size, sum: sum),
//             body: Container(
//                 height: size.height,
//                 width: size.width,
//                 child: ListView(children: [
//                   Stack(children: [
//                     Container(
//                       height: size.height,
//                       width: size.width,
//                       color: product.bgColor,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 100),
//                       height: 350,
//                       width: size.width,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage(
//                                 product.image,
//                               ),
//                               fit: BoxFit.contain)),
//                     ),
//                     Container(
//                       height: 780,
//                       width: size.width,
//                       child: ListView(
//                         children: [
//                           SizedBox(
//                             height: 345,
//                           ),
//                           Container(
//                             child: Stack(
//                               children: [
//                                 Container(
//                                     margin: EdgeInsets.only(top: 30),
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         borderRadius: BorderRadius.only(
//                                             topLeft: Radius.circular(50),
//                                             topRight: Radius.circular(55))),
//                                     child: Column(children: [
//                                       Container(
//                                           height: 470,
//                                           child: Stack(
//                                             children: [
//                                               Positioned(
//                                                 top: 50,
//                                                 left: 40,
//                                                 child: Text(product.name,
//                                                     style: TextStyle(
//                                                       letterSpacing: 1.1,
//                                                       color: Colors.black,
//                                                       fontFamily: 'Inter',
//                                                       fontWeight:
//                                                           FontWeight.w600,
//                                                       fontSize: 33,
//                                                     )),
//                                               ),
//                                               Positioned(
//                                                 top: 100,
//                                                 left: 44,
//                                                 child: Text(product.description,
//                                                     style: TextStyle(
//                                                       color: Colors.black,
//                                                       fontFamily: 'OpenSans',
//                                                       fontWeight:
//                                                           FontWeight.w400,
//                                                       fontSize: 16,
//                                                     )),
//                                               ),
//                                               Container(
//                                                 margin:
//                                                     EdgeInsets.only(top: 190),
//                                                 child: NutrientBar(
//                                                   text: product.p1,
//                                                   percent: product.p1Percent,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 margin:
//                                                     EdgeInsets.only(top: 250),
//                                                 child: NutrientBar(
//                                                   text: product.p2,
//                                                   percent: product.p2Percent,
//                                                 ),
//                                               ),
//                                               Container(
//                                                 margin:
//                                                     EdgeInsets.only(top: 310),
//                                                 child: NutrientBar(
//                                                   text: product.p3,
//                                                   percent: product.p3Percent,
//                                                 ),
//                                               ),
//                                               Positioned(
//                                                 top: 400,
//                                                 left: 50,
//                                                 child: Text(
//                                                   'Rs.${product.price.toString()}',
//                                                   style: TextStyle(
//                                                       color: Color(0xff181818),
//                                                       fontFamily: 'Roboto',
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontSize: 30),
//                                                 ),
//                                               ),
//                                               Positioned(
//                                                   top: 390,
//                                                   left: 200,
//                                                   child: LoginButtonTextSize(
//                                                     size: size,
//                                                     text: 'Add to Cart',
//                                                     textcolour: Colors.white,
//                                                     containercolour:
//                                                         Colors.black,
//                                                     buttonHoriz: 35,
//                                                     buttonVertical: 14,
//                                                     press: () {
//                                                       //Add to Cart
//                                                     },
//                                                     fontSize: 18,
//                                                   )),
//                                             ],
//                                           )),
//                                       Container(
//                                         margin: EdgeInsets.only(),
//                                         padding: EdgeInsets.only(
//                                           left: 15,
//                                           right: 15,
//                                         ),
//                                         height: 680,
//                                         width: size.width,
//                                         child: GridView.builder(
//                                           physics:
//                                               NeverScrollableScrollPhysics(),
//                                           itemCount: searchResult.length,
//                                           gridDelegate:
//                                               SliverGridDelegateWithFixedCrossAxisCount(
//                                                   childAspectRatio: 0.9,
//                                                   crossAxisCount: 2,
//                                                   crossAxisSpacing: 15.0,
//                                                   mainAxisSpacing: 25.0),
//                                           itemBuilder: (context, index) =>
//                                               SearchResultContainers(
//                                             onpress: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           SinglesPage(
//                                                               isFav: searchResult[
//                                                                       index]
//                                                                   .isFavourite,
//                                                               product:
//                                                                   searchResult[
//                                                                       index])));
//                                             },
//                                             resultIndex: searchResult[index],
//                                             isFav:
//                                                 searchResult[index].isFavourite,
//                                           ),
//                                         ),
//                                       ),
//                                     ])),
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       isFav = !isFav;
//                                     });
//                                   },
//                                   child: Container(
//                                     margin: EdgeInsets.only(top: 0, left: 50),
//                                     padding: EdgeInsets.only(top: 4, left: 0),
//                                     height: 65,
//                                     width: 65,
//                                     decoration: BoxDecoration(
//                                       color: Colors.white,
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: Icon(
//                                       Icons.favorite,
//                                       size: 45,
//                                       color: isFav
//                                           ? Color(0xffFF0E0E)
//                                           : Color(0xffC7C7C7),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // GestureDetector(
//                     //   onTap: () {
//                     //     setState(() {
//                     //       isFav = !isFav;
//                     //     });
//                     //   },
//                     //   child: Container(
//                     //     margin: EdgeInsets.only(top: 0, left: 80),
//                     //     padding: EdgeInsets.only(top: 4, left: 0),
//                     //     height: 65,
//                     //     width: 65,
//                     //     decoration: BoxDecoration(
//                     //       color: Colors.white,
//                     //       shape: BoxShape.circle,
//                     //     ),
//                     //     child: Icon(
//                     //       Icons.favorite,
//                     //       size: 45,
//                     //       color: isFav ? Color(0xffFF0E0E) : Color(0xffC7C7C7),
//                     //     ),
//                     //   ),
//                     //   // child: Container(
//                     //   //   height: 100,
//                     //   //   width: 100,
//                     //   //   color: isFav
//                     //   //       ? Colors.red
//                     //   //       : Colors.grey,
//                     // ),

//                     Container(
//                       height: 70,
//                       width: size.width,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(30),
//                           bottomRight: Radius.circular(30),
//                         ),
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.topRight,
//                           colors: [
//                             Color(0xffFF0808),
//                             Color(0xffFFB199),
//                           ],
//                         ),
//                       ),
//                     ),
//                     //drawer opener person icon
//                     Container(
//                       margin: EdgeInsets.only(left: 10, top: 0),
//                       child: Builder(
//                         builder: (BuildContext context) {
//                           return IconButton(
//                             color: Colors.white,
//                             iconSize: 32,
//                             icon: Icon(
//                               Icons.person,
//                             ),
//                             onPressed: () {
//                               Scaffold.of(context).openDrawer();
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                     //Notification icon
//                     Container(
//                       margin: EdgeInsets.only(left: 290, top: 0),
//                       child: Builder(
//                         builder: (BuildContext context) {
//                           return IconButton(
//                             color: Colors.white,
//                             iconSize: 32,
//                             icon: Icon(
//                               Icons.notifications_active,
//                             ),
//                             onPressed: () {
//                               //Navigate to Notification Page
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                     //Shopping Cart
//                     Container(
//                       margin: EdgeInsets.only(left: 345, top: 0),
//                       child: Builder(
//                         builder: (BuildContext context) {
//                           return IconButton(
//                             color: Colors.white,
//                             iconSize: 32,
//                             icon: Icon(
//                               Icons.shopping_cart,
//                             ),
//                             onPressed: () {
//                               Scaffold.of(context).openEndDrawer();
//                             },
//                           );
//                         },
//                       ),
//                     ),
//                   ]),
//                 ]))));
//   }
// }

// }
