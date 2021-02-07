import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/address.dart';

import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/screens/addAdress.dart';

class AddressSelector extends StatefulWidget {
  static const String id = 'AddressSlector';
  @override
  _AddressSelectorState createState() => _AddressSelectorState();
}

class _AddressSelectorState extends State<AddressSelector> {
  int selectedIndex = 0;
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
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(90.0),
              child: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
              ),
            ),
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: size.height - 100,
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
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: address.length,
                          itemBuilder: (context, index) =>
                              buildGestureDetector(index),
                        ),
                      ),
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
                    Positioned(
                      top: size.height * 0.65, // ,425
                      left: size.width * 0.17, //60
                      child: LoginButton(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget buildGestureDetector(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Container(
          height: 170,
          decoration: BoxDecoration(
            color:
                selectedIndex == index ? Color(0xffFF5454) : Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 70,
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
    );
  }
}
