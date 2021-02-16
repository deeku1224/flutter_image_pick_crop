import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/addAdress.dart';
import 'package:flutter_image_pick_crop/widgets/addressListView.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/profile2Aligned.dart';
import 'package:flutter_image_pick_crop/widgets/nuniTextAligned.dart';
import 'package:flutter_image_pick_crop/widgets/accountAligned.dart';

class AddressSelector extends StatefulWidget {
  static const String id = 'AddressSlector';
  @override
  _AddressSelectorState createState() => _AddressSelectorState();
}

class _AddressSelectorState extends State<AddressSelector> {
  int selectedIndex = 0;
  void indexProvider(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xffFF0808),
            Color(0xffFFB199),
          ],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawerScrimColor: Colors.transparent,
          drawer: DrawerStart(),
          body: Stack(
            children: [
              Profile2Aligned(),
              NuniTextAligned(),
              AccountAligned(),
              Container(
                margin: EdgeInsets.only(top: 95),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    topLeft: Radius.circular(60),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Container(
                          height: 500,
                          child: AddressListView(
                            selectedIndex: selectedIndex,
                            onPress: (index) {
                              indexProvider(index);
                            },
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AddAdress.id);
                      },
                      child: Text(
                        '                                             + Add new address',
                        style: TextStyle(
                            color: Color(0xff707070),
                            fontFamily: 'Poppins',
                            fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 20),
                    LoginButton(
                      size: size,
                      buttonVertical: size.height * 0.015, //24
                      buttonHoriz: size.width * 0.2, //120
                      containercolour: Colors.black,
                      textcolour: Colors.white,
                      text: "Proceed",
                      press: () {
                        //Navigate to Next Page
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
