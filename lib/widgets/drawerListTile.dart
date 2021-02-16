import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    this.icon,
    this.text,
    this.onPress,
    this.fontWeight,
    this.fontSize,
  }) : super(key: key);
  final Widget icon;
  final String text;
  final Function onPress;
  final FontWeight fontWeight;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onPress();
      },
      leading: icon,
      title: Text(
        text,
        style: TextStyle(
            color: Color(0xff3D3D3D),
            fontFamily: 'Inter',
            fontSize: fontSize,
            fontWeight: fontWeight),
      ),
    );
  }
}
