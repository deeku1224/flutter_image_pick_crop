import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_pick_crop/screens/cancelation.dart';
import 'package:flutter_image_pick_crop/screens/registerOtp.dart';
import 'package:flutter_image_pick_crop/screens/registerPhoneUnfilled.dart';
import 'package:flutter_image_pick_crop/screens/registerName.dart';
import 'package:flutter_image_pick_crop/screens/registerPassword.dart';
import 'package:flutter_image_pick_crop/screens/login.dart';
import 'package:flutter_image_pick_crop/screens/selectAddress.dart';
import 'package:flutter_image_pick_crop/screens/home.dart';
import 'screens/registerLogin.dart';
import 'package:flutter_image_pick_crop/screens/addAdress.dart';
import 'package:flutter_image_pick_crop/screens/myAccount.dart';
import 'package:flutter_image_pick_crop/screens/historyPage.dart';
import 'package:flutter_image_pick_crop/screens/paymentMethod.dart';
import 'package:flutter_image_pick_crop/screens/bill.dart';
import 'package:flutter_image_pick_crop/screens/checkOut.dart';
import 'package:flutter_image_pick_crop/screens/historySinglePage.dart';
import 'package:flutter_image_pick_crop/screens/myOrderSingleList.dart';
import 'package:flutter_image_pick_crop/screens/searchResult.dart';
import 'package:flutter_image_pick_crop/screens/notification.dart';
import 'package:flutter_image_pick_crop/screens/privacyPolicy.dart';
import 'package:flutter_image_pick_crop/screens/termsAndConditions.dart';
import 'package:flutter_image_pick_crop/screens/orderSuccess.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Nuni',
        theme: ThemeData(),
        initialRoute: RegisterLogin.id,
        routes: {
          RegisterLogin.id: (context) => RegisterLogin(),
          RegisterPhoneUnfilled.id: (context) => RegisterPhoneUnfilled(),
          Otp.id: (context) => Otp(),
          RegisterName.id: (context) => RegisterName(),
          RegisterPassword.id: (context) => RegisterPassword(),
          Login.id: (context) => Login(),
          AddAdress.id: (context) => AddAdress(),
          AddressSelector.id: (context) => AddressSelector(),
          Cancelation.id: (context) => Cancelation(),
          HomePage.id: (context) => HomePage(),
          MyAccount.id: (context) => MyAccount(),
          HistoryPage.id: (context) => HistoryPage(),
          PaymentMethod.id: (context) => PaymentMethod(),
          Bill.id: (context) => Bill(),
          CheckOut.id: (context) => CheckOut(),
          HistorySinglePage.id: (context) => HistorySinglePage(),
          MyOrderSingleList.id: (context) => MyOrderSingleList(),
          //needs some changes
          SearchResult.id: (context) => SearchResult(),
          Notifications.id: (context) => Notifications(),
          PrivacyPolicy.id: (context) => PrivacyPolicy(),
          TermsAndCondition.id: (context) => TermsAndCondition(),
          OrderSuccess.id: (context) => OrderSuccess(),
        });
  }
}
