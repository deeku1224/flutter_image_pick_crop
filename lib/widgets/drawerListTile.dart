import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key key,
    this.icon,
    this.text,
    this.onPress,
  }) : super(key: key);
  final Icon icon;
  final String text;
  final Function onPress;

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
            fontSize: 19,
            fontWeight: FontWeight.w200),
      ),
    );
  }
}
