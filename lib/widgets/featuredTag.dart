import 'package:flutter/material.dart';

class FeaturedTag extends StatelessWidget {
  const FeaturedTag({
    Key key,
    @required this.size,
    this.text,
    this.onPress,
    this.width,
  }) : super(key: key);

  final Size size;
  final String text;
  final Function onPress;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 15),
      height: 40,
      width: size.width,
      color: Color(0xffFF4D4D),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                fontSize: 18,
                letterSpacing: 1.1),
          ),
          SizedBox(
            width: width,
          ),
          InkWell(
            onTap: () {
              onPress();
            },
            child: Text(
              'Show All',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 13,
                  letterSpacing: 1.1),
            ),
          ),
        ],
      ),
    );
  }
}
