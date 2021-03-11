import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/myOrderSingleList.dart';
import 'dart:async';

class OrderSuccess extends StatefulWidget {
  static const String id = 'OrderSuccess';

  @override
  _OrderSuccessState createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  Timer _timer;
  @override
  void initState() {
    startTime();
    super.initState();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return _timer = Timer(duration, route);
  }

  route() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyOrderSingleList(
                  navFrom: 'orderSuccess',
                )));
  }

  @override
  void deactivate() {
    _timer.cancel();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Order has been placed',
              style: TextStyle(
                  color: Color(0xff555555),
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Text(
              'Sucesssfully',
              style: TextStyle(
                  color: Color(0xff555555),
                  fontFamily: 'Inter',
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
