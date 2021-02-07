import 'package:flutter/material.dart';

class AuthTwoLines extends StatelessWidget {
  const AuthTwoLines({
    Key key,
    @required this.size,
    this.text1,
    this.text2,
  }) : super(key: key);

  final Size size;
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
          text: TextSpan(children: <TextSpan>[
        TextSpan(
            text: text1,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: size.height * 0.026)),
        TextSpan(
            text: text2,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: size.height * 0.026)),
      ])),
    );
  }
}
