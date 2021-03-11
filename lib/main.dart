import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/screens/cancelation.dart';
import 'package:flutter_image_pick_crop/screens/registerOtp.dart';
import 'package:flutter_image_pick_crop/screens/registerPhoneUnfilled.dart';
import 'package:flutter_image_pick_crop/screens/registerName.dart';
import 'package:flutter_image_pick_crop/screens/registerPassword.dart';
import 'package:flutter_image_pick_crop/screens/login.dart';
import 'package:flutter_image_pick_crop/screens/home.dart';
import 'screens/registerLogin.dart';
import 'package:flutter_image_pick_crop/screens/historyPage.dart';
import 'package:flutter_image_pick_crop/screens/paymentMethod.dart';
import 'package:flutter_image_pick_crop/screens/bill.dart';
import 'package:flutter_image_pick_crop/screens/checkOut.dart';
import 'package:flutter_image_pick_crop/screens/privacyPolicy.dart';
import 'package:flutter_image_pick_crop/screens/termsAndConditions.dart';
import 'package:flutter_image_pick_crop/screens/orderSuccess.dart';
import 'package:flutter_image_pick_crop/screens/splashScreen.dart';
import 'package:flutter_image_pick_crop/screens/customerService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return ChangeNotifierProvider<MyCart>(
      create: (_) => MyCart(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nuni',
          theme: ThemeData(
            accentColor: Colors.transparent,
            accentColorBrightness: Brightness.light,
          ),
          initialRoute: Splash.id,
          routes: {
            Splash.id: (context) => Splash(),
            // assests\images\tenor.gif
            RegisterLogin.id: (context) => RegisterLogin(),
            RegisterPhoneUnfilled.id: (context) => RegisterPhoneUnfilled(),
            Otp.id: (context) => Otp(),
            RegisterName.id: (context) => RegisterName(),
            RegisterPassword.id: (context) => RegisterPassword(),
            Login.id: (context) => Login(),

            HomePage.id: (context) => HomePage(),
            HistoryPage.id: (context) => HistoryPage(),

            Cancelation.id: (context) => Cancelation(),
            PaymentMethod.id: (context) => PaymentMethod(),
            Bill.id: (context) => Bill(),
            CheckOut.id: (context) => CheckOut(),
            PrivacyPolicy.id: (context) => PrivacyPolicy(),
            TermsAndCondition.id: (context) => TermsAndCondition(),
            OrderSuccess.id: (context) => OrderSuccess(),
            CustomerService.id: (context) => CustomerService(),
          }),
    );
  }
}
