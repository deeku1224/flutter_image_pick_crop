import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/registerPassword.dart';
import 'package:flutter_image_pick_crop/widgets/welcomeToNuni.dart';
import 'package:flutter_image_pick_crop/widgets/authQuoteText.dart';
import 'package:flutter_image_pick_crop/widgets/authTwoLines.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';

class RegisterName extends StatefulWidget {
  static const String id = 'RegisterName';
  @override
  _RegisterNameState createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
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
        resizeToAvoidBottomInset: false,
        body: Container(
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
                        child: Container(
                          height: size.height,
                          width: size.width,
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.07272),
                          child: TextField(
                            onSubmitted: (value) {
                              setState(
                                () {
                                  name = value;
                                  if (name.length > 3) {
                                    namevalid = true;
                                  }
                                },
                              );
                            },
                            cursorColor: Colors.white,
                            maxLength: 20,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.height * 0.025),
                            decoration: InputDecoration(
                              counterText: "",
                              hintText: 'Name',
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'OpenSans'),
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
                            if (selectedRadio != 0 && namevalid) {
                              Navigator.popAndPushNamed(
                                  context, RegisterPassword.id);
                            }
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
    );
  }
}
