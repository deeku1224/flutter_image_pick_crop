import 'package:flutter/material.dart';

class BlurredSmallContainer extends StatelessWidget {
  const BlurredSmallContainer({
    Key key,
    this.onPress,
    this.index,
    this.image,
    this.name,
    this.price,
  }) : super(key: key);

  final Function onPress;
  final int index;
  final String image;
  final String name;
  final double price;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Stack(
        children: [
          Container(
            height: 210,
            width: 176.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assests/images/Group 18.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24, top: 15),
            child: Container(
              height: 95,
              width: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 62, top: 115),
            child: Text(
              name,
              style: TextStyle(
                  color: Color(0xff353535),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 40, top: 130),
            child: Text(
              'Starts @ Rs.${price}',
              style: TextStyle(
                  color: Color(0xff353535),
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
