import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/searchIcon.dart';

class SearchAligned extends StatelessWidget {
  const SearchAligned({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 220, top: 10),
      child: SearchIcon(),
    );
  }
}
