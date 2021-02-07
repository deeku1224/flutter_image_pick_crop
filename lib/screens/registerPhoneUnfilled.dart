import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/registerOtp.dart';
import 'package:flutter_image_pick_crop/screens/login.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/widgets/welcomeToNuni.dart';
import 'package:flutter_image_pick_crop/widgets/authQuoteText.dart';
import 'package:flutter_image_pick_crop/widgets/authTwoLines.dart';
import 'package:flutter_image_pick_crop/widgets/authEndText.dart';
import 'package:flutter/services.dart';

class RegisterPhoneUnfilled extends StatefulWidget {
  static const String id = 'RegisterPhoneUnFilled';
  static String phoneNumber;

  @override
  _RegisterPhoneUnfilledState createState() => _RegisterPhoneUnfilledState();
}

class _RegisterPhoneUnfilledState extends State<RegisterPhoneUnfilled> {
  bool numberLength = false;
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffee6300),
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: ExactAssetImage(
                    'assests/images/register-phone-unfilled.png'),
                fit: BoxFit.fill,
                alignment: Alignment.topCenter),
          ),
          child: Stack(
            children: [
              SafeArea(
                child: Container(
                  height: size.height,
                  width: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        top: size.height * 0.05,
                        left: size.width * 0.077,
                        child: Container(
                          child: WelcomeToNuni(size: size),
                        ),
                      ),
                      Positioned(
                          top: size.height * 0.250,
                          left: size.width * 0.077,
                          child: AuthQuoteText(
                              text: 'Register to continue:)', size: size)),
                      Positioned(
                        top: size.height * 0.5,
                        left: size.width * 0.077,
                        child: AuthTwoLines(
                          size: size,
                          text1: 'Please enter your\n',
                          text2: 'mobile phone number\n',
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.75,
                        left: size.width * 0.126,
                        child: LoginButton(
                          size: size,
                          text: 'Get started',
                          containercolour: Colors.white,
                          textcolour: Colors.black,
                          buttonVertical: size.height * 0.0289756097,
                          buttonHoriz: size.width * 0.19,
                          press: () {
                            setState(() {
                              if (_formKey.currentState.validate()) {
                                Navigator.popAndPushNamed(context, Otp.id);
                              } else {
                                //alert dialog
                              }
                            });
                          },
                        ),
                      ),
                      Positioned(
                        top: size.height * 0.865,
                        left: size.width * 0.126,
                        child: AuthEndtext(
                          size: size,
                          text: 'Already have a account?',
                          textOnButton: 'Log In',
                          press: () {
                            Navigator.popAndPushNamed(context, Login.id);
                            //navigate to Log In page
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: size.height * 0.678,
                      left: size.width * 0.07,
                    ),
                    child: Text(
                      '+91',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height * 0.03,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.66),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                        horizontal: size.width * 0.07),
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        validator: (String value) {
                          if (value.length != 10)
                            return '⚠ Mobile Number must be VALID';
                        },
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.height * 0.023,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold),
                        cursorColor: Colors.white,
                        maxLengthEnforced: true,
                        onChanged: (value) {
                          // if (value.length == 10) {
                          //   numberLength = true;
                          Getnumber(value);
                          // }
                          //get phone numer
                        },
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 14),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          counterText: '',
                          // hintText: 'Enter Number',
                          hintStyle: TextStyle(color: Colors.white),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.01,
                              horizontal: size.width * 0.14),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
void Getnumber(gd) => RegisterPhoneUnfilled.phoneNumber = gd;
