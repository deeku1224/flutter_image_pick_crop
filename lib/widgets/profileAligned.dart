import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/leadingIcon.dart';

class ProfileAligned extends StatelessWidget {
  const ProfileAligned({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 7, top: 10),
      child: LeadingIcon(),
    );
  }
}
