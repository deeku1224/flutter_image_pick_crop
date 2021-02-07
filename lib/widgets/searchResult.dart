import 'package:flutter/material.dart';

class SearchResultContainers extends StatefulWidget {
  const SearchResultContainers({
    Key key,
    this.resultIndex,
    this.onpress,
  }) : super(key: key);
  final resultIndex;
  final Function onpress;
  @override
  _SearchResultContainersState createState() =>
      _SearchResultContainersState(resultIndex, onpress);
}

class _SearchResultContainersState extends State<SearchResultContainers> {
  final resultIndex;
  final Function onpress;
  _SearchResultContainersState(this.resultIndex, this.onpress);
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    //bool isFavourite = resultIndex.isFavourite;
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: 220,
          child: GestureDetector(
            onTap: () {
              onpress();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(10)),
              child: Stack(
                children: [
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(resultIndex.image))),
                  ),
                  Positioned(
                    top: 145,
                    left: 10,
                    child: Text(
                      resultIndex.name,
                      style: TextStyle(
                          color: Color(0xffFF5858),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                    ),
                  ),
                  Positioned(
                    top: 160,
                    left: 13,
                    child: Text(
                      resultIndex.tamilName,
                      style: TextStyle(
                          color: Color(0xff727070),
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 10,
                    child: Text(
                      'Rs.${resultIndex.price * (resultIndex.price / 100)}',
                      style: TextStyle(
                          color: Color(0xff545454),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 55,
                    child: Text(
                      resultIndex.price.toString(),
                      style: TextStyle(
                          // decoration: TextDecoration.lineThrough,
                          color: Color(0xff8F7E7E),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 10),
                    ),
                  ),
                  Positioned(
                    top: 180,
                    left: 85,
                    child: Text(
                      '${resultIndex.offerPercent}% Off',
                      style: TextStyle(
                          color: Color(0xffB2B2B2),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                    ),
                  ),
                  Positioned(
                    top: 177,
                    left: 57,
                    child: Text(
                      '\\',
                      style: TextStyle(
                          color: Color(0xff8F7E7E),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isFavourite = !isFavourite;
            });
          },
          child: Container(
            margin: EdgeInsets.only(top: 5, left: 130),
            padding: EdgeInsets.only(top: 4, left: 0),
            height: 47,
            width: 47,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite,
              size: 35,
              color: isFavourite ? Color(0xffFF0E0E) : Color(0xffC7C7C7),
            ),
          ),
        ),
      ],
    );
  }
}
