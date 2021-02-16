import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Profile2 extends StatelessWidget {
  const Profile2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return IconButton(
        iconSize: 50,
        icon: SvgPicture.asset('assests/icons/Frame (3).svg'),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      );
    });
  }
}
