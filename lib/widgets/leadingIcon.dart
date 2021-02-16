import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return IconButton(
        iconSize: 45,
        padding: EdgeInsets.only(left: 15, top: 0),
        icon: SvgPicture.asset('assests/icons/Frame (3).svg'),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    });
  }
}
