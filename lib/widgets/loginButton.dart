import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key key,
    @required this.size,
    this.text,
    this.textcolour,
    this.containercolour,
    this.buttonHoriz,
    this.buttonVertical,
    this.press,
  }) : super(key: key);
  final double buttonVertical;
  final String text;
  final Color textcolour;
  final Color containercolour;
  final double buttonHoriz;
  final Function press;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: containercolour,
        padding: EdgeInsets.symmetric(
            horizontal: buttonHoriz, vertical: buttonVertical), //24
        onPressed: () {
          press();
        },
        child: Text(
          text,
          style: TextStyle(
              color: textcolour,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: size.height * 0.03),
        ),
      ),
    );
  }
}

class LoginButtonTextSize extends StatelessWidget {
  const LoginButtonTextSize({
    Key key,
    @required this.size,
    this.text,
    this.textcolour,
    this.containercolour,
    this.buttonHoriz,
    this.buttonVertical,
    this.press,
    this.fontSize,
  }) : super(key: key);
  final double buttonVertical;
  final String text;
  final Color textcolour;
  final Color containercolour;
  final double buttonHoriz;
  final Function press;
  final Size size;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: containercolour,
        padding: EdgeInsets.symmetric(
            horizontal: buttonHoriz, vertical: buttonVertical), //24
        onPressed: () {
          press();
        },
        child: Text(
          text,
          style: TextStyle(
              color: textcolour,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
              fontSize: fontSize),
        ),
      ),
    );
  }
}
