import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/welcomeToNuni.dart';
import 'package:flutter_image_pick_crop/widgets/authQuoteText.dart';
import 'package:flutter_image_pick_crop/widgets/authTwoLines.dart';
import 'registerPhoneUnfilled.dart';
import 'dart:async';
import 'package:flutter_image_pick_crop/screens/registerName.dart';
import 'package:flutter_image_pick_crop/widgets/authEndText.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp extends StatefulWidget {
  static const String id = 'RegisterOtp';
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  var _formOtpKey = GlobalKey<FormState>();
  int countdown = 30;
  Timer _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (countdown > 0) {
          countdown--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String otpCode;
    TextEditingController textEditingController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xff0b2336),
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assests/images/register-otp.png'),
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
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.077,
                            top: size.height * 0.06,
                          ),
                          child: Container(
                            child: WelcomeToNuni(size: size),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.250,
                          left: size.width * 0.077,
                          child: AuthQuoteText(
                            size: size,
                            text: "Let's confirm it's yours",
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.5,
                          left: size.width * 0.077,
                          child: AuthTwoLines(
                            size: size,
                            text1: 'Please enter the OTP sent\n',
                            text2:
                                'to +91 ${RegisterPhoneUnfilled.phoneNumber}',
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.7,
                          left: size.width * 0.1,
                          child: Container(
                            height: size.height,
                            width: size.width,
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18.0),
                                    color: Colors.white,
                                  ),
                                  height: size.height * 0.113,
                                  width: size.width * 0.420,
                                ),
                                Positioned(
                                  top: size.height * 0.038,
                                  left: size.width * 0.0606,
                                  child: Container(
                                    child: Text(
                                      '$countdown\s Left',
                                      style: TextStyle(
                                          color: Color(0xff121212),
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins',
                                          fontSize: size.height * 0.0276),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: size.width * 0.290 * 0.5 * 2,
                                  child: Container(
                                    child: RaisedButton(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                      ),
                                      color: Colors.black,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.290 * 0.5,
                                        vertical: size.height * 0.025,
                                      ), //24
                                      onPressed: () {
                                        setState(() {
                                          if (_formOtpKey.currentState
                                              .validate()) {
                                            Navigator.popAndPushNamed(
                                                context, RegisterName.id);
                                          }
                                        });

                                        //NAV to name
                                      },
                                      child: Text(
                                        'Go >',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            fontSize: size.height * 0.043),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.82,
                          left: size.width * 0.5,
                          child: Material(
                            color: Colors.transparent,
                            shadowColor: Colors.transparent,
                            child: MaterialButton(
                              splashColor: Colors.transparent,
                              onPressed: () {
                                //resend otp
                              },
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(
                                    fontFamily: 'OpenSans',
                                    fontSize: size.height * 0.023,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.866,
                          left: size.width * 0.11,
                          child: AuthEndtext(
                            size: size,
                            text: 'Wrong mobile number',
                            textOnButton: 'Change',
                            press: () {
                              Navigator.popAndPushNamed(
                                  context, RegisterPhoneUnfilled.id);
                            },
                          ),
                        ),
                        Container(
                          height: size.height,
                          width: size.width,
                          padding: EdgeInsets.only(
                            top: size.height * 0.59,
                          ),
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  OtpBox(size: size),
                                  OtpBox(size: size),
                                  OtpBox(size: size),
                                  OtpBox(size: size),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.06060),
                                child: Form(
                                  key: _formOtpKey,
                                  child: PinCodeTextField(
                                    appContext: context,
                                    validator: (String value) {
                                      if (value.length != 4)
                                        return '⚠ Complete the otp';
                                    },
                                    length: 4,
                                    onChanged: (value) {
                                      //use in case want to show some effects
                                    },
                                    onCompleted: (value) {
                                      setState(() {
                                        otpCode = value;
                                      });
                                    },
                                    animationType: AnimationType.scale,
                                    pastedTextStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    keyboardType: TextInputType.phone,
                                    cursorColor: Colors.black,
                                    backgroundColor: Colors.transparent,
                                    controller: textEditingController,
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderWidth: 1,
                                      borderRadius: BorderRadius.circular(10),
                                      activeColor: Colors.transparent,
                                      disabledColor: Colors.transparent,
                                      inactiveColor: Colors.transparent,
                                      selectedColor: Colors.transparent,
                                      inactiveFillColor: Colors.red,
                                      selectedFillColor: Colors.red,
                                      fieldHeight: size.height * 0.065,
                                      fieldWidth: size.width * 0.128,
                                      activeFillColor: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OtpBox extends StatelessWidget {
  const OtpBox({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.065,
      width: size.width * 0.128,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
    );
  }
}
