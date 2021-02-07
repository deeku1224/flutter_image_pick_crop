import 'package:flutter/material.dart';

class Notifications {
  final String primaryText, secondaryText, image;

  Notifications(this.primaryText, this.secondaryText, this.image);
}

List<Notifications> notifications = [
  Notifications(
      'Order Successful', 'Salem Mango', 'assests/images/register-otp.png'),
  Notifications('To be delivered today', 'Salem Mango, Gauva, bananna...',
      'assests/images/register-otp.png'),
];
