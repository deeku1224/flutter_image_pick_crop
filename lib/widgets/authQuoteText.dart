import 'package:flutter/material.dart';

class AuthQuoteText extends StatelessWidget {
  const AuthQuoteText({
    Key key,
    @required this.size,
    this.text,
  }) : super(key: key);

  final Size size;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'OpenSans',
          color: Colors.white,
          fontSize: size.height * 0.03,
        ),
      ),
    );
  }
}
// 'Register to continue:)'
