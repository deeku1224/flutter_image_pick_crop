import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';

class Cancelation extends StatefulWidget {
  static const String id = 'cancelation';
  @override
  _CancelationState createState() => _CancelationState();
}

class _CancelationState extends State<Cancelation> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffff2f2f),
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              // Image(image: Image.asset(),)
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                height: 300,
                width: size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assests/images/Rectangle 459.png"))),
              ),
              //Reason Field
              Container(
                margin: EdgeInsets.only(top: 290),
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                  cursorColor: Colors.white,
                  textAlignVertical: TextAlignVertical.bottom,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Reason',
                    hintStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xffFFFFFF),
                        fontFamily: 'OpenSans'),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              //Notes Heading
              Container(
                margin: EdgeInsets.only(top: 270),
                padding: EdgeInsets.only(top: 100, left: 20),
                child: Text(
                  "Notes",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 18),
                ),
              ),
              //TextFiled
              Container(
                width: 370,
                height: 200,
                margin: EdgeInsets.only(top: 410, left: 20),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                  maxLines: 6,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    hintText: 'type here',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0xffFFFFFF),
                        fontFamily: 'OpenSans'),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white,
                    width: 3,
                  ),
                ),
              ),
              //Confirm Button
              Positioned(
                top: 660,
                left: 90,
                child: LoginButton(
                  size: size,
                  text: 'Confirm',
                  containercolour: Colors.black,
                  textcolour: Colors.white,
                  buttonVertical: size.height * 0.02,
                  buttonHoriz: size.width * 0.16,
                  press: () {
                    showAnimatedDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          contentPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          content: Container(
                            height: 260,
                            width: 420,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffFF0924),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Are You Sure To',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                Text(
                                  'Cancel?',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    LoginButtonTextSize(
                                      size: size,
                                      text: 'Cancel',
                                      textcolour: Color(0xffFFFFFF),
                                      containercolour: Color(0xff000000),
                                      buttonHoriz: 30,
                                      buttonVertical: 17,
                                      press: () {
                                        Navigator.pop(context);
                                      },
                                      fontSize: 17,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    LoginButtonTextSize(
                                      size: size,
                                      text: 'Confirm',
                                      textcolour: Color(0xffFFFFFF),
                                      containercolour: Color(0xffFF596C),
                                      buttonHoriz: 30,
                                      buttonVertical: 17,
                                      press: () {
                                        //go to what to do next
                                      },
                                      fontSize: 17,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      animationType: DialogTransitionType.scale,
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(seconds: 1),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
