import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/address.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressListView extends StatelessWidget {
  const AddressListView({
    Key key,
    @required this.selectedIndex,
    this.onPress,
  }) : super(key: key);
  final Function onPress;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: address.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          onPress(index);
        },
        child: Padding(
          padding: EdgeInsets.only(top: 20, left: 30, right: 30),
          child: Container(
            height: 170,
            decoration: BoxDecoration(
              color: selectedIndex == index
                  ? Color(0xffFF5454)
                  : Color(0xffF0F0F0),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 15,
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 0,
                      ),
                      height: 40,
                      width: 40,
                      child: SvgPicture.asset(
                        'assests/icons/Group 43.svg',
                        color: selectedIndex == index
                            ? Color(0xffFFB5B5)
                            : Color(0xffE0E0E0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 26,
                        left: 6.5,
                      ),
                      height: 27,
                      width: 27,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: selectedIndex == index
                            ? Color(0xffFF5454)
                            : Color(0xffFFFFFF),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '${address[index].title}',
                      style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${address[index].door},${address[index].street},\n${address[index].area},\n${address[index].district},${address[index].state}',
                      style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
