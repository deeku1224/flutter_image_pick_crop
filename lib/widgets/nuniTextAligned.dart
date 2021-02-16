import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/nuniText.dart';

class NuniTextAligned extends StatelessWidget {
  const NuniTextAligned({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 110,
      child: NuniText(),
    );
  }
}
