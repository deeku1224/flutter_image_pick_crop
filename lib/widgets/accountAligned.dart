import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/user.dart';
import 'package:flutter_image_pick_crop/screens/myAccount.dart';

class AccountAligned extends StatelessWidget {
  const AccountAligned({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 14,
      left: 330,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyAccount(navFrom: 'icon')));
        },
        child: CircleAvatar(
          radius: 32,
          backgroundImage: AssetImage(user[0].image),
        ),
      ),
    );
  }
}
