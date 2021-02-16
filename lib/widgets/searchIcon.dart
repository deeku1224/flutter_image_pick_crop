import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/searchBar.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return Container(
        margin: EdgeInsets.only(right: 10),
        child: IconButton(
          icon: Icon(
            Icons.search,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () {
            showSearch(context: context, delegate: SearchBar());
          },
        ),
      );
    });
  }
}
