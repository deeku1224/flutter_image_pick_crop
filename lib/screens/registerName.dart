import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/registerPassword.dart';
import 'package:flutter_image_pick_crop/widgets/welcomeToNuni.dart';
import 'package:flutter_image_pick_crop/widgets/authQuoteText.dart';
import 'package:flutter_image_pick_crop/widgets/authTwoLines.dart';
import 'package:flutter_image_pick_crop/widgets/authTextField.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';

class RegisterName extends StatefulWidget {
  static const String id = 'RegisterName';
  @override
  _RegisterNameState createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  var _formNameKey = GlobalKey<FormState>();
  int selectedRadio;
  bool namevalid = false;
  String name;
  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

  void setseletedRadio(int value) {
    setState(() {
      selectedRadio = value;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xff959a71),
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assests/images/register-name.png'),
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
                            text: "Let's know your Name",
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.5,
                          left: size.width * 0.077,
                          child: AuthTwoLines(
                            size: size,
                            text1: 'Enter your Sweet Name',
                            text2: '',
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.55,
                          child: Form(
                            key: _formNameKey,
                            child: AuthTextField(
                              hintText: 'Name',
                              obscureText: false,
                              size: size,
                              name: name,
                              validator: (value) {
                                if (value.length < 3)
                                  return '⚠ Name must be atleast 3 letters';
                              },
                              press: (value) {},
                            ),
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.648,
                          left: size.width * 0.0606,
                          child: Row(
                            children: [
                              Radio(
                                activeColor: Colors.green,
                                groupValue: selectedRadio,
                                value: 1,
                                onChanged: (value) {
                                  //get data and store in database
                                  setseletedRadio(value);
                                },
                              ),
                              Text(
                                'Veg only',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.024,
                                ),
                              ),
                              Radio(
                                activeColor: Colors.green,
                                groupValue: selectedRadio,
                                value: 2,
                                onChanged: (value) {
                                  //get data and store in database
                                  setseletedRadio(value);
                                },
                              ),
                              Text(
                                'Veg and NON-Veg',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'OpenSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.024,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: size.height * 0.76,
                          left: size.width * 0.157,
                          child: LoginButton(
                            size: size,
                            text: 'Next',
                            textcolour: Colors.black,
                            containercolour: Colors.white,
                            buttonHoriz: size.height * 0.138,
                            buttonVertical: size.height * 0.0289756097,
                            press: () {
                              setState(() {
                                if (selectedRadio != 0 &&
                                    _formNameKey.currentState.validate()) {
                                  Navigator.popAndPushNamed(
                                      context, RegisterPassword.id);
                                }
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],

              ///
            ),
          ),
        ),
      ),
    );
  }
}
