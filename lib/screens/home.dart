import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/modals/offerProduct.dart';
import 'package:flutter_image_pick_crop/modals/homeVegetables.dart';
import 'package:flutter_image_pick_crop/modals/diaryProduct.dart';
import 'package:flutter_image_pick_crop/modals/featuredProduct.dart';
import 'package:flutter_image_pick_crop/modals/productNameHome.dart';
import 'package:flutter_image_pick_crop/modals/user.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/offerCarusel.dart';
import 'package:flutter_image_pick_crop/modals/homeNonVeg.dart';
import 'package:flutter_image_pick_crop/modals/homeFruits.dart';
import 'package:flutter_image_pick_crop/modals/searchResult.dart';
import 'package:flutter_image_pick_crop/screens/singlesPage.dart';
import 'package:flutter_image_pick_crop/screens/searchResult.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/searchIcon.dart';
import 'package:flutter_image_pick_crop/widgets/notificationIcon.dart';
import 'package:flutter_image_pick_crop/widgets/cartIcon.dart';
import 'package:flutter_image_pick_crop/widgets/leadingIcon.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/widgets/featuredTag.dart';
import 'package:flutter_image_pick_crop/widgets/heartHomePage.dart';
import 'package:flutter_image_pick_crop/widgets/offerCard.dart';

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
    return WillPopScope(
      onWillPop: () {
        //dialog need to be added
      },
      child: Container(
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
            endDrawer: DrawerCart(
              sum: sum,
              size: size,
            ),
            drawer: DrawerStart(
              currentPage: 1,
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: LeadingIcon(),
                actions: <Widget>[
                  SearchIcon(),
                  NotificationIcon(),
                  CartIcon(),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResult(
                                      product: searchResult,
                                    )));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResult(
                                      product: searchResult,
                                    )));
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
                                                          isFav:
                                                              vegetables[index]
                                                                  .isFavourite,
                                                          product: vegetables[
                                                              index])));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 55, top: 90),
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
                                          product:
                                              vegetables[index].isFavourite,
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
                                        child: Consumer<MyCart>(
                                          builder: (context, myCart, child) =>
                                              LoginButtonTextSize(
                                            size: size,
                                            text: 'Add to Cart',
                                            textcolour: Colors.white,
                                            containercolour: Color(0xff2C2C2C),
                                            buttonHoriz: 40,
                                            buttonVertical: 15,
                                            press: () {
                                              myCart
                                                  .addToCart(vegetables[index]);

                                              setState(() {
                                                cartItems
                                                    .add(vegetables[index]);
                                                cartItems.forEach((item) {
                                                  sum = 0;
                                                  sum = sum + item.price;
                                                });
                                              }); //take id and send
                                            },
                                            fontSize: 18,
                                          ),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchResult(
                                              product: searchResult,
                                            )));
                                //Navigate to Show All
                              },
                              child: Text(
                                'Show all   ᐳ',
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
                                                          isFav:
                                                              homeNonVeg[index]
                                                                  .isFavourite,
                                                          product: homeNonVeg[
                                                              index])));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 55, top: 90),
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
                                          product:
                                              homeNonVeg[index].isFavourite,
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
                                        child: Consumer<MyCart>(
                                          builder: (context, myCart, child) =>
                                              LoginButtonTextSize(
                                            size: size,
                                            text: 'Add to Cart',
                                            textcolour: Colors.white,
                                            containercolour: Color(0xff2C2C2C),
                                            buttonHoriz: 40,
                                            buttonVertical: 15,
                                            press: () {
                                              myCart
                                                  .addToCart(homeNonVeg[index]);

                                              setState(() {
                                                cartItems
                                                    .add(homeNonVeg[index]);
                                                myCart.cartItems
                                                    .forEach((item) {
                                                  sum = 0;
                                                  sum = sum + item.price;
                                                });
                                              }); //take id and send
                                            },
                                            fontSize: 18,
                                          ),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchResult(
                                              product: searchResult,
                                            )));
                                //Navigate to Show All
                              },
                              child: Text(
                                'Show all   ᐳ',
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
                                                          isFav:
                                                              homeFruits[index]
                                                                  .isFavourite,
                                                          product: homeFruits[
                                                              index])));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 55, top: 90),
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
                                          product:
                                              homeFruits[index].isFavourite,
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
                                        child: Consumer<MyCart>(
                                          builder: (context, myCart, child) =>
                                              LoginButtonTextSize(
                                            size: size,
                                            text: 'Add to Cart',
                                            textcolour: Colors.white,
                                            containercolour: Color(0xff2C2C2C),
                                            buttonHoriz: 40,
                                            buttonVertical: 15,
                                            press: () {
                                              myCart
                                                  .addToCart(homeFruits[index]);

                                              setState(() {
                                                cartItems
                                                    .add(homeFruits[index]);
                                                cartItems.forEach((item) {
                                                  sum = 0;
                                                  sum = sum + item.price;
                                                });
                                              }); //take id and send
                                            },
                                            fontSize: 18,
                                          ),
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SearchResult(
                                              product: searchResult,
                                            )));
                                //Navigate to Show All
                              },
                              child: Text(
                                'Show all  ᐳ',
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
      ),
    );
  }
}
