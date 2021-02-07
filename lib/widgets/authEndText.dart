import 'package:flutter/material.dart';

class AuthEndtext extends StatelessWidget {
  const AuthEndtext({
    Key key,
    @required this.size,
    this.text,
    this.textOnButton,
    this.press,
  }) : super(key: key);

  final Size size;
  final String text;
  final String textOnButton;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: size.height * 0.026,
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
          ),
          TextButton(
              onPressed: () {
                press();
                //push to login page
              },
              child: Text(
                textOnButton,
                style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: size.height * 0.026,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
