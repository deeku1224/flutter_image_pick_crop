import 'package:flutter/material.dart';

class PaymentOptionBox extends StatelessWidget {
  const PaymentOptionBox({
    Key key,
    this.top,
    this.text,
    this.image,
    this.imageHeight,
    this.imageWidth,
    this.press,
    this.color,
  }) : super(key: key);
  final double top, imageHeight, imageWidth;
  final String text, image;
  final Function press;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press();
      },
      child: Container(
        margin: EdgeInsets.only(top: top, left: 58), //329
        height: 62,
        width: 297,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Stack(
          children: [
            Positioned(
              top: 17,
              left: 70,
              child: Text(
                text,
                style: TextStyle(
                    color: Color(0xff434343),
                    fontFamily: 'OpenSans',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 240, top: 10),
              height: imageHeight,
              width: imageWidth,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
