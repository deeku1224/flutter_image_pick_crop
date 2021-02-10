import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/modals/product.dart';

import 'dart:ui';
import 'package:flutter_image_pick_crop/screens/checkOut.dart';

class DrawerCart extends StatefulWidget {
  const DrawerCart({
    Key key,
    @required this.size,
    @required this.sum,
  }) : super(key: key);

  final Size size;
  final double sum;

  @override
  _DrawerCartState createState() => _DrawerCartState(size, sum);
}

class _DrawerCartState extends State<DrawerCart> {
  final Size size;
  double sum;
  _DrawerCartState(this.size, this.sum);

  @override
  Widget build(BuildContext context) {
    return Theme(
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
                                    padding:
                                        EdgeInsets.only(top: 7.5, bottom: 8),
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
                                                      cartItems[index].image),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(left: 18),
                                              child: Text(
                                                  'Rs.${cartItems[index].price}'),
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 50),
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
                              await Navigator.pushNamed(context, CheckOut.id);
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
    );
  }
}

// class CartItemDisplayer extends StatelessWidget {
//  final index;

//   const CartItemDisplayer({Key key, this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(top: 7.5, bottom: 8),
//       child: Stack(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Container(
//                 height: 60,
//                 width: 80,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(cartItems[index].image),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 18),
//                 child: Text('Rs.${cartItems[index].price}'),
//               )
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 50),
//             child: IconButton(
//               icon: Icon(
//                 Icons.remove_circle,
//               ),
//               onPressed: () {
//                 // setState(() {
//                 //   cartItems.removeAt(index);
//                 // });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
