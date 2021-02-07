import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:percent_indicator/percent_indicator.dart';

class NutrientBar extends StatelessWidget {
  const NutrientBar({
    Key key,
    this.percent,
    this.text,
  }) : super(key: key);

  final double percent;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
                color: Color(0xff696969),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          LinearPercentIndicator(
            animation: true,
            animationDuration: 1000,
            backgroundColor: Color(0xffF2F2F2),
            fillColor: Colors.transparent,
            linearGradient: LinearGradient(
              colors: [Color(0xffFFB199), Color(0xffFF0000)], // red to yellow
              // repeats the gradient over the canvas
            ),
            linearStrokeCap: LinearStrokeCap.roundAll,
            //progressColor: Color(0xffFF0000),
            lineHeight: 20,
            percent: percent * 0.01,
          ),
        ],
      ),
    );
  }
}
