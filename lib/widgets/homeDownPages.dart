import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_image_pick_crop/screens/SinglesPage.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';

class HomeDownPages extends StatefulWidget {
  const HomeDownPages(
      {Key key,
      @required this.size,
      this.bgimage,
      this.topic,
      this.topicText,
      this.itemcount,
      this.productImage,
      this.product,
      @required this.sum})
      : super(key: key);
  final product;
  final double sum;
  final Size size;
  final String bgimage, topic, topicText, productImage;
  final int itemcount;

  @override
  _HomeDownPagesState createState() => _HomeDownPagesState(
      product, size, bgimage, topic, topicText, productImage, itemcount, sum);
}

class _HomeDownPagesState extends State<HomeDownPages> {
  double sum;
  final product;
  final Size size;
  final String bgimage, topic, topicText, productImage;
  final int itemcount;

  _HomeDownPagesState(this.product, this.size, this.bgimage, this.topic,
      this.topicText, this.productImage, this.itemcount, this.sum);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgimage), fit: BoxFit.fill),
      ),
      child: Stack(
        children: [
          Container(
              padding: EdgeInsets.only(
                top: 115,
                left: 20,
              ),
              child: Text(
                topic,
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
              topicText,
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
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: itemcount,
                itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.only(left: 22, right: 27),
                  child: Stack(
                    children: [
                      //blurbig Containeer
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12),
                          child: Container(
                            height: 430,
                            width: 275,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade400.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(40)),
                          ),
                        ),
                      ),
                      //vegetable image
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SinglesPage(product: product[index])));
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 55, top: 90),
                          height: 180,
                          width: 140,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(product[index].image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      //vegetable name
                      Positioned(
                        top: 250,
                        left: 50,
                        child: Text(
                          product[index].name,
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
                          'Rs.${product[index].price}',
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
                            // setState(() {
                            //   cartItems.add(product[index]);
                            //   cartItems.forEach((item) {
                            //     sum = 0;
                            //     sum = sum + item.price;
                            //   });
                            // }); //take id and send
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
    );
  }
}
