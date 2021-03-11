import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_image_pick_crop/modals/address.dart';
import 'package:flutter_image_pick_crop/screens/selectAddress.dart';
import 'package:flutter_image_pick_crop/screens/myAccount.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';

class AddAdress extends StatefulWidget {
  final String navFrom;

  const AddAdress({Key key, this.navFrom}) : super(key: key);
  @override
  _AddAdressState createState() => _AddAdressState(navFrom);
}

class Area {
  int id;
  String areaName;
  Area(this.id, this.areaName);

  static List<Area> getAreas() {
    return <Area>[
      Area(1, 'Peramanur'),
      Area(2, 'Meyyanur'),
      Area(3, 'Nethimedu'),
      Area(4, 'Sivathapuram'),
      Area(5, 'Omalur'),
    ];
  }
}

class _AddAdressState extends State<AddAdress> {
  List<Area> _areas = Area.getAreas();
  List<DropdownMenuItem<Area>> _dropDownMenuItems;
  Area selectedArea;

  final String navFrom;

  _AddAdressState(this.navFrom);
  @override
  void initState() {
    _dropDownMenuItems = buildDropdownMenuItems(_areas);
    // selectedArea = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Area>> buildDropdownMenuItems(List areas) {
    List<DropdownMenuItem<Area>> items = List();
    for (Area area in areas) {
      items.add(
        DropdownMenuItem(
          value: area,
          child: Text(area.areaName),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(Area kselectedArea) {
    setState(() {
      selectedArea = kselectedArea;
    });
  }

  var _formTitleKey = GlobalKey<FormState>();
  var _formDoorNoKey = GlobalKey<FormState>();
  var _formStreetKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assests/images/add adress.png'),
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.19,
                ),
                Container(
                  height: size.height * 0.75,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Color(0xffFF1C1C).withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      topLeft: Radius.circular(60),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 55,
                        left: 30,
                        child: Text(
                          'Add new address',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                      ),
                      AddressReciverBar(
                        textTop: 137,
                        textLeft: 35,
                        text: 'TITLE',
                        keyBoardType: TextInputType.name,
                        formKey: _formTitleKey,
                        validator: (value) {
                          if (value.length == 0)
                            return '⚠ Title must not empty';
                        },
                        containerLeft: 30,
                        containerTop: 159,
                        containerWidth: 359,
                        hintText: 'Ex:Home/Office',
                      ),
                      AddressReciverBar(
                        textTop: 229,
                        textLeft: 35,
                        text: 'DOOR NO.',
                        keyBoardType: TextInputType.number,
                        formKey: _formDoorNoKey,
                        validator: (value) {
                          if (value.length > 6)
                            return '⚠ Enter a Valid Door No';
                        },
                        containerLeft: 30,
                        containerTop: 251,
                        containerWidth: 140,
                        hintText: 'Type Here',
                      ),
                      AddressReciverBar(
                        textTop: 229,
                        textLeft: 205,
                        text: 'STREET',
                        keyBoardType: TextInputType.name,

                        formKey: _formStreetKey,
                        validator: (value) {
                          if (value.length < 4)
                            return '⚠ Enter a Proper Street name';
                        },
                        containerLeft: 200, //30
                        containerTop: 251,
                        containerWidth: 189,
                        hintText: 'Type Street Name',
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 30, top: 343),
                        padding: EdgeInsets.only(
                          left: 28,
                        ),
                        height: 46,
                        width: 359,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButton(
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 16),
                          underline: DropdownButtonHideUnderline(
                            child: SizedBox(
                              width: 159,
                            ),
                          ),
                          value: selectedArea,
                          items: _dropDownMenuItems,
                          onChanged: onChangeDropdownItem,
                          hint: Text(
                            'Peramanur',
                            style: TextStyle(
                                color: Color(0xff6A6A6A),
                                fontFamily: 'OpenSans',
                                fontWeight: FontWeight.normal,
                                fontSize: 15),
                          ),
                        ),
                      ),
                      FixedAddress(
                          textTop: 413,
                          textLeft: 35,
                          text: 'DISTRICT',
                          containerLeft: 30,
                          containerTop: 435,
                          containerWidth: 140,
                          containerText: 'Salem'),
                      FixedAddress(
                          textTop: 413,
                          textLeft: 205,
                          text: 'STATE',
                          containerLeft: 200, //30
                          containerTop: 435,
                          containerWidth: 189,
                          containerText: 'Tamil Nadu'),
                      Positioned(
                        top: 500,
                        left: 30,
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: '*Currently available only in ',
                              style: TextStyle(fontFamily: 'OpenSans'),
                            ),
                            TextSpan(
                              text: 'Salem ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                            ),
                            TextSpan(
                              text: 'district in ',
                              style: TextStyle(fontFamily: 'OpenSans'),
                            ),
                            TextSpan(
                              text: 'Tamil Nadu ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'OpenSans'),
                            ),
                          ]),
                        ),
                      ),
                      Positioned(
                        top: 545,
                        left: 90,
                        child: LoginButtonTextSize(
                          size: size,
                          fontSize: 21,
                          text: 'Add Now',
                          containercolour: Colors.black,
                          textcolour: Colors.white,
                          buttonVertical: size.height * 0.015,
                          buttonHoriz: size.width * 0.14,
                          press: () {
                            if (address.length <= 5 &&
                                _formTitleKey.currentState.validate() &&
                                _formDoorNoKey.currentState.validate() &&
                                _formStreetKey.currentState.validate()) {
                              if (navFrom == 'checkOut') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddressSelector(
                                              navFrom: 'checkOut',
                                            )));
                              } else if (navFrom == 'myAccount') {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyAccount(
                                              navFrom: 'drawer',
                                            )));
                              }
                            } else if (address.length > 5 &&
                                selectedArea == null) {
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'You Cannot Add More',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                          Text(
                                            'than 5 Address',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 30),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          LoginButtonTextSize(
                                            size: size,
                                            text: 'Ok',
                                            textcolour: Color(0xffFFFFFF),
                                            containercolour: Color(0xff000000),
                                            buttonHoriz: 45,
                                            buttonVertical: 14,
                                            press: () {
                                              Navigator.pop(context);
                                            },
                                            fontSize: 17,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                animationType: DialogTransitionType.scale,
                                curve: Curves.fastOutSlowIn,
                                duration: Duration(seconds: 1),
                              );
                            }
                          },
                        ),
                      ),
                    ],
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

class FixedAddress extends StatelessWidget {
  const FixedAddress({
    this.textTop,
    this.textLeft,
    this.text,
    this.containerLeft,
    this.containerTop,
    this.containerWidth,
    Key key,
    this.containerText,
  }) : super(key: key);
  final double textTop;
  final double textLeft;
  final String text;
  final double containerLeft;
  final double containerTop;
  final String containerText;
  final double containerWidth;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: textTop,
          left: textLeft,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: containerLeft, top: containerTop),
          padding: EdgeInsets.only(
            top: 11,
            left: 28,
          ),
          height: 46,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            containerText,
            style: TextStyle(
                color: Color(0xff6A6A6A),
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}

class AddressReciverBar extends StatelessWidget {
  const AddressReciverBar({
    Key key,
    this.textTop,
    this.textLeft,
    this.text,
    this.containerLeft,
    this.containerTop,
    this.hintText,
    this.containerWidth,
    this.formKey,
    this.validator,
    this.keyBoardType,
  }) : super(key: key);
  final double textTop;
  final double textLeft;
  final String text;
  final double containerLeft;
  final double containerTop;
  final String hintText;
  final double containerWidth;
  final formKey;
  final validator;
  final TextInputType keyBoardType;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: textTop,
          left: textLeft,
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                fontSize: 14),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: containerLeft, top: containerTop),
          padding: EdgeInsets.only(
            bottom: 0,
            left: 28,
          ),
          height: 46,
          width: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
            key: formKey,
            child: TextFormField(
              validator: validator,
              keyboardType: keyBoardType,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                errorStyle: TextStyle(color: Colors.teal),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xff6A6A6A),
                  fontFamily: 'OpenSans',
                  fontSize: 14,
                ),
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
          ),
        ),
      ],
    );
  }
}
