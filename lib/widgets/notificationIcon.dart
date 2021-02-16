import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/notification.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.only(right: 15),
        child: IconButton(
          icon: Icon(
            Icons.notifications_active,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushNamed(context, Notifications.id);
          },
        ),
      );
    });
  }
}
