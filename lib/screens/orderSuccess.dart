import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/myOrderSingleList.dart';
import 'dart:async';

class OrderSuccess extends StatefulWidget {
  static const String id = 'OrderSuccess';

  @override
  _OrderSuccessState createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushNamed(context, MyOrderSingleList.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
