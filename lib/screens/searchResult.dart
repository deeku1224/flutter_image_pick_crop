import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/modals/searchResult.dart';
import 'package:flutter_image_pick_crop/modals/favourites.dart';
import 'package:flutter_image_pick_crop/screens/singlesPage.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/widgets/searchResult.dart';
import 'package:flutter_image_pick_crop/widgets/searchAligned.dart';
import 'package:flutter_image_pick_crop/widgets/notificationAligned.dart';
import 'package:flutter_image_pick_crop/widgets/cartAligned.dart';
import 'package:flutter_image_pick_crop/widgets/profileAligned.dart';

class SearchResult extends StatefulWidget {
  final product;
  final String navFrom;
  const SearchResult({Key key, this.product, this.navFrom}) : super(key: key);
  @override
  _SearchResultState createState() => _SearchResultState(product, navFrom);
}

class _SearchResultState extends State<SearchResult> {
  final product;
  final String navFrom;
  _SearchResultState(this.product, this.navFrom);

  ScrollController _scrollController = ScrollController();
  int currentMax = 6;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    for (int index = currentMax; index < currentMax + 6; index++) {
      product.add(product[index]);
    }
    //currentMax = currentMax + 6;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double sum = 0;

    final total = [
      for (Product cartItem in cartItems) {sum = sum + cartItem.price}
    ];
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => navFrom == 'drawer' ? false : true,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xfff2f2f2),
          drawerScrimColor: Colors.transparent,
          drawer: DrawerStart(
            currentPage: product == favouriteProduct ? 5 : 1,
          ),
          endDrawer: DrawerCart(size: size, sum: sum),
          body: Stack(
            children: [
              Column(
                //physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 70,
                    ),
                    padding: EdgeInsets.only(left: 15, right: 15, top: 15),
                    height: 701,
                    // height: searchResult.length<6?size.height:size.height+(100*()),

                    width: size.width,

                    child: GridView.builder(
                        controller: _scrollController,
                        physics: BouncingScrollPhysics(),
                        //physics: NeverScrollableScrollPhysics(),
                        itemCount: product.length + 1,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.9,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15.0,
                            mainAxisSpacing: 25.0),
                        itemBuilder: (context, index) {
                          if (index == product.length ||
                              index + 1 == product.length) {
                            return CupertinoActivityIndicator();
                          }
                          return SearchResultContainers(
                            onpress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SinglesPage(
                                          isFav: product[index].isFavourite,
                                          product: product[index])));
                            },
                            resultIndex: product[index],
                            isFav: product[index].isFavourite,
                          );
                        }),
                  ),
                  // ),
                ],
              ),
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
              ProfileAligned(),
              //searchIcon
              SearchAligned(),
              //Notification icon
              NotificationAligned(),
              //Shopping Cart
              CartAligned(),
            ],
          ),
        ),
      ),
    );
  }
}
