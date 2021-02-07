import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    Key key,
    @required this.size,
    this.name,
    this.press,
    this.obscureText,
    this.hintText,
    this.validator,
  }) : super(key: key);

  final Size size;
  final String name;
  final Function press;
  final bool obscureText;
  final String hintText;
  final Function validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.07272),
      child: TextFormField(
        validator: validator,
        onChanged: (value) {
          press(value);
        },
        obscureText: obscureText,
        cursorColor: Colors.white,
        maxLength: 20,
        keyboardType: TextInputType.name,
        textAlign: TextAlign.start,
        style: TextStyle(
            color: Colors.white,
            fontSize: size.height * 0.023,
            fontFamily: 'OpenSans'),
        decoration: InputDecoration(
          errorStyle: TextStyle(
              color: Color(0xffc4bebe), fontFamily: 'OpenSans', fontSize: 14),
          counterText: "",
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
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
    );
  }
}
