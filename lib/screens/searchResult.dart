import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/modals/searchResult.dart';
import 'package:flutter_image_pick_crop/screens/singlesPage.dart';
import 'package:flutter_image_pick_crop/widgets/searchResult.dart';

class SearchResult extends StatefulWidget {
  static const String id = 'SearchResult';
  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
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
        backgroundColor: Color(0xfff2f2f2),
        drawerScrimColor: Colors.transparent,
        drawer: DrawerStart(),
        endDrawer: DrawerCart(size: size, sum: sum),
        body: Stack(
          children: [
            ListView(
              children: [
                SizedBox(
                  height: 150,
                ),
                Container(
                  margin: EdgeInsets.only(),
                  padding: EdgeInsets.only(
                    top: 0,
                    left: 15,
                    right: 15,
                  ),
                  height: 680,
                  // height: searchResult.length<6?size.height:size.height+(100*()),

                  width: size.width,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: searchResult.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.9,
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.0,
                        mainAxisSpacing: 25.0),
                    itemBuilder: (context, index) => SearchResultContainers(
                      onpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SinglesPage(product: searchResult[index])));
                      },
                      resultIndex: searchResult[index],
                    ),
                  ),
                ),
                // ),
              ],
            ),

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
          ],
        ),
      ),
    );
  }
}
