import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/notificationIcon.dart';

class NotificationAligned extends StatelessWidget {
  const NotificationAligned({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 290, top: 10),
      child: NotificationIcon(),
    );
  }
}
