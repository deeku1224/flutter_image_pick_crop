import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/widgets/authQuoteText.dart';
import 'package:flutter_image_pick_crop/widgets/authTextField.dart';
import 'package:flutter_image_pick_crop/widgets/obscureIcon.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/widgets/authEndText.dart';
import 'package:flutter_image_pick_crop/screens/registerPhoneUnfilled.dart';
import 'package:flutter_image_pick_crop/screens/home.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formNumberKey = GlobalKey<FormState>();
  var _formPasswordKey = GlobalKey<FormState>();

  bool showpassword;

  @override
  void initState() {
    super.initState();

    showpassword = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xff000101),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assests/images/actuallogin.png'),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  top: size.height * 0.12,
                  left: size.width * 0.077,
                  child: Text(
                    "Let's Sign In",
                    style: TextStyle(
                      letterSpacing: 1.1,
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.18,
                  left: size.width * 0.077,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Welcome',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.048),
                      ),
                      TextSpan(
                        text: '  ',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: size.height * 0.039),
                      ),
                      TextSpan(
                        text: 'back',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: size.height * 0.039),
                      ),
                    ]),
                  ),
                ),
                Positioned(
                  top: size.height * 0.27,
                  left: size.width * 0.079,
                  child: AuthQuoteText(
                    size: size,
                    text: "You've been missed",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.48),
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
                  child: Form(
                    key: _formNumberKey,
                    child: TextFormField(
                      validator: (String value) {
                        if (value.length != 10) return '⚠ Enter a VALID Number';
                      },
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: size.height * 0.023,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.normal),
                      cursorColor: Colors.white,
                      maxLengthEnforced: true,
                      onChanged: (value) {
                        //get phone numer
                      },
                      maxLength: 10,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Color(0xffc4bebe), fontFamily: 'OpenSans'),
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
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.57,
                  child: Form(
                    key: _formPasswordKey,
                    child: AuthTextField(
                      size: size,
                      hintText: 'Password',
                      press: (value) {
                        //
                      },
                      validator: (value) {
                        if (value.length < 6) {
                          return '⚠ The password is not valid';
                        }
                      },
                      obscureText: showpassword,
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.58,
                  left: size.width * 0.799,
                  child: ObscureIcon(
                    iconesize: size.height * 0.039,
                    showpassword: showpassword,
                    press: () {
                      setState(() {
                        showpassword = !showpassword;
                      });
                    },
                  ),
                ),
                Positioned(
                  top: size.height * 0.635,
                  left: size.width * 0.55,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.w100,
                          fontSize: size.height * 0.021),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.73,
                  left: size.width * 0.16,
                  child: LoginButton(
                      size: size,
                      text: 'Log In',
                      textcolour: Colors.black,
                      containercolour: Colors.white,
                      buttonHoriz: size.width * 0.24,
                      buttonVertical: size.height * 0.023,
                      press: () {
                        setState(() {
                          if (_formNumberKey.currentState.validate() &&
                              _formPasswordKey.currentState.validate()) {
                            Navigator.pushNamed(context, HomePage.id);
                          }
                        });
                      }),
                ),
                Positioned(
                  top: size.height * 0.83,
                  left: size.width * 0.126,
                  child: AuthEndtext(
                    size: size,
                    text: 'Dont have a account?',
                    textOnButton: 'Register',
                    press: () {
                      Navigator.popAndPushNamed(
                          context, RegisterPhoneUnfilled.id);
                      //navigate to Register page
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
