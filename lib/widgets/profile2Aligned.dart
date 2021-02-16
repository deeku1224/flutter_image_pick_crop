import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/profile2.dart';

class Profile2Aligned extends StatelessWidget {
  const Profile2Aligned({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 15,
      left: 5,
      child: Profile2(),
    );
  }
}
