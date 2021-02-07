import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/screens/registerPhoneUnfilled.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:flutter_image_pick_crop/screens/login.dart';

class RegisterLogin extends StatelessWidget {
  static const String id = 'RegisterLogin';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assests/images/LOGIN.png'),
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
                  Welcome(size: size),
                  ToNuni(size: size),
                  Container(
                    padding: EdgeInsets.only(
                        top: size.height * 0.1710, left: size.width * 0.0825),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Something Awesome is\n',
                            style: TextStyle(
                                color: Color(0xff606060),
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'OpenSans'),
                          ),
                          TextSpan(
                            text: 'Waiting for you',
                            style: TextStyle(
                                color: Color(0xff606060),
                                fontSize: size.height * 0.03,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'OpenSans'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.65, // ,425
                    left: size.width * 0.164, //60
                    child: LoginButton(
                      size: size,
                      buttonVertical: 20, //24
                      buttonHoriz: 106.5, //120
                      containercolour: Colors.white,
                      textcolour: Colors.black,
                      text: "Login",
                      press: () {
                        Navigator.pushNamed(context, Login.id);
                      },
                    ),
                  ),
                  Positioned(
                    top: size.height * 0.79, //660
                    left: size.width * 0.164, //60
                    child: LoginButton(
                      size: size,
                      buttonVertical: 20, //24
                      buttonHoriz: 90, //105
                      containercolour: Colors.red,
                      textcolour: Colors.white,
                      text: "Register",
                      press: () {
                        Navigator.pushNamed(context, RegisterPhoneUnfilled.id);
                      },
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class ToNuni extends StatelessWidget {
  const ToNuni({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.099, //size.height * 0.099, //82
      left: size.width * 0.088, //size.width * 0.088, //33
      child: Container(
        child: Row(
          children: [
            Text(
              'to',
              style: TextStyle(
                  fontFamily: 'Inter',
                  color: Color(0xff606060),
                  fontWeight: FontWeight.w300,
                  fontSize: size.height * 0.044),
            ),
            SizedBox(
              width: size.width * 0.024,
            ),
            Text(
              'Nuni',
              style: TextStyle(
                  fontFamily: 'Inter',
                  color: Colors.red,
                  fontSize: size.height * 0.046,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: size.height * 0.02, left: size.width * 0.08),
      child: Text(
        'Welcome',
        style: TextStyle(
            color: Color(0xff414141),
            fontSize: size.height * 0.065,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter'),
      ),
    );
  }
}
