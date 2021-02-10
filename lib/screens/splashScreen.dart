import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_image_pick_crop/screens/registerLogin.dart';

class Splash extends StatelessWidget {
  static const String id = 'Splashscreen';
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 15,
      backgroundColor: Color(0xffF2F2F2),
      image: Image.asset('assests/images/tenor.gif'),
      loaderColor: Colors.white,
      photoSize: 100,
      navigateAfterSeconds: RegisterLogin(),
    );
  }
}
