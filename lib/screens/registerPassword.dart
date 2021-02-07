import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/welcomeToNuni.dart';
import 'package:flutter_image_pick_crop/widgets/authQuoteText.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/widgets/authTextField.dart';
import 'package:flutter_image_pick_crop/widgets/obscureIcon.dart';
import 'package:flutter_image_pick_crop/screens/home.dart';

class RegisterPassword extends StatefulWidget {
  static const String id = 'RegisterPasssword';
  @override
  _RegisterPasswordState createState() => _RegisterPasswordState();
}

class _RegisterPasswordState extends State<RegisterPassword> {
  var _formPasswordKey = GlobalKey<FormState>();
  var _formConfirmPasswordKey = GlobalKey<FormState>();
  String password;
  String confirmpassword;
  bool showpassword;
  bool showconfirmpassword;
  @override
  void initState() {
    super.initState();
    password = '*';
    confirmpassword = '\\';
    showpassword = false;
    showconfirmpassword = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xff367c4b),
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assests/images/register (1).png'),
                  fit: BoxFit.fill,
                  alignment: Alignment.topCenter),
            ),
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: size.width * 0.077,
                      top: size.height * 0.06,
                    ),
                    child: WelcomeToNuni(size: size),
                  ),
                  Positioned(
                    top: size.height * 0.250,
                    left: size.width * 0.077,
                    child: AuthQuoteText(
                      size: size,
                      text: "Let's protect you",
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.5,
                    left: size.width * 0.077,
                    child: Text('Create Your Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.03)),
                  ),
                  Positioned(
                    top: size.height * 0.57,
                    child: Form(
                      key: _formPasswordKey,
                      child: AuthTextField(
                        size: size,
                        hintText: 'Password',
                        validator: (value) {
                          if (value.length < 6)
                            return '⚠ Password must be Atleast 6 letters';
                          else if (value.length == 0)
                            return 'Password Can not be empty';
                        },
                        press: (value) {
                          password = value;
                          setState(() {});
                          //value is the password
                        },
                        obscureText: showpassword,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.65,
                    child: Form(
                      key: _formConfirmPasswordKey,
                      child: AuthTextField(
                        size: size,
                        hintText: 'Confirm Password',
                        validator: (value) {
                          if (value != password)
                            return "⚠ both the passwords Don't match";
                        },
                        press: (value) {
                          confirmpassword = value;
                          setState(() {});
                          //value is the password
                        },
                        obscureText: showconfirmpassword,
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.76,
                    left: size.width * 0.157,
                    child: LoginButton(
                        size: size,
                        text: 'Complete',
                        textcolour: Colors.black,
                        containercolour: Colors.white,
                        buttonHoriz: size.height * 0.1,
                        buttonVertical: size.height * 0.0289756097,
                        press: () {
                          setState(() {
                            if (_formPasswordKey.currentState.validate() &&
                                _formConfirmPasswordKey.currentState
                                    .validate()) {
                              Navigator.pushNamed(context, HomePage.id);
                            }
                          });
                          //if confirmpassword == password then navigate to home pages
                          //get to the home page
                        }),
                  ),
                  Positioned(
                    top: size.height * 0.58,
                    left: size.width * 0.799,
                    child: ObscureIcon(
                      iconesize: size.height * 0.039,
                      showpassword: showpassword,
                      press: () {
                        setState(
                          () {
                            showpassword = !showpassword;
                          },
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.662,
                    left: size.width * 0.799,
                    child: ObscureIcon(
                      iconesize: size.height * 0.039,
                      showpassword: showconfirmpassword,
                      press: () {
                        setState(
                          () {
                            showconfirmpassword = !showconfirmpassword;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
