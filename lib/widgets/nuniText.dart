import 'package:flutter/material.dart';

class NuniText extends StatelessWidget {
  const NuniText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Nuni',
        style: TextStyle(
            color: Colors.white,
            fontFamily: 'SairaStencilOne',
            fontWeight: FontWeight.normal,
            fontSize: 60,
            letterSpacing: 8),
      ),
    );
  }
}
