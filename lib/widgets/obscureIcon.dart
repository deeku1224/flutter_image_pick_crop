import 'package:flutter/material.dart';

class ObscureIcon extends StatelessWidget {
  const ObscureIcon({
    Key key,
    @required this.showpassword,
    this.press,
    this.iconesize,
  }) : super(key: key);

  final bool showpassword;
  final Function press;
  final double iconesize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: iconesize,
      color: Color(0XffFFFFFF),
      icon: !showpassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      onPressed: () {
        press();
      },
    );
  }
}
