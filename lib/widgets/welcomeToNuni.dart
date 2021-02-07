import 'package:flutter/material.dart';

class WelcomeToNuni extends StatelessWidget {
  const WelcomeToNuni({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.02,
          ),
          child: Text(
            'Welcome',
            style: TextStyle(
                fontFamily: 'Inter',
                color: Colors.white,
                fontSize: size.height * 0.065,
                fontWeight: FontWeight.w300),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: size.height * 0.085, //size.height * 0.099, //82
          ),
          child: Row(
            children: [
              Text(
                'to',
                style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontWeight: FontWeight.w200,
                    fontSize: size.height * 0.065),
              ),
              SizedBox(
                width: size.width * 0.040,
              ),
              Text(
                'Nuni',
                style: TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: size.height * 0.065,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
