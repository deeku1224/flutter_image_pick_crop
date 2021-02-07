import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_image_pick_crop/modals/Product.dart';
import 'package:flutter_image_pick_crop/widgets/drawer.dart';
import 'package:flutter_image_pick_crop/widgets/drawerCart.dart';
import 'package:flutter_image_pick_crop/modals/cart.dart';
import 'package:flutter_image_pick_crop/modals/address.dart';
import 'package:flutter_image_pick_crop/modals/user.dart';
import 'package:flutter_image_pick_crop/screens/addAdress.dart';
import 'package:flutter_image_pick_crop/widgets/loginButton.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

//import 'package:path/path.dart';
class MyAccount extends StatefulWidget {
  static final String id = 'MyAccount';
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  File _pickedImage;

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Future uploadPic(BuildContext context) async {
    //   //String fileName = basename(_pickedImage.path);
    //   StorageReference storageReference =
    //       FireBaseStorage.instace.ref().child(_pickedImage.path);
    //   StorageUploadTask uploadTask = storageReference.putFile(_pickedImage);
    //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    //   setState(() {
    //     Scaffold.of(context)
    //         .showSnackBar(SnackBar(content: Text('Profile Picture uploaded')));
    //   });
    // }

    double sum = 0;
    // ignore: unused_local_variable
    final total = [
      for (Product cartItem in cartItems)
        {
          setState(() {
            sum = sum + cartItem.price;
          })
        }
    ];
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assests/images/My account.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.transparent,
        drawerScrimColor: Colors.transparent,
        drawer: DrawerStart(),
        endDrawer: DrawerCart(size: size, sum: sum),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          leading: Builder(builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.person,
                size: 28,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
          actions: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.only(right: 15),
                  child: IconButton(
                    icon: Icon(
                      Icons.notifications_active,
                      size: 28,
                    ),
                    onPressed: () {
                      // Navigatige to notification page
                    },
                  ),
                );
              },
            ),
            Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.only(right: 15),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 28,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 120),
              child: Text(
                'My Profile',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 34),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 45, top: 65),
              height: 250,
              width: 315,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffFF1632),
              ),
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 220, top: 20),
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(Icons.camera),
                      onPressed: () {
                        _showPickedOptionDialog(context);
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 100,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0),
                          height: 111,
                          width: 116.24,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: _pickedImage != null
                                  ? FileImage(_pickedImage)
                                  : AssetImage(
                                      'assests/images/Ellipse 368.jpg'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '${user[0].name}',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '9863646683',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 280),
              height: 310,
              width: 440,
              child: Padding(
                padding: EdgeInsets.only(top: 40),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: address.length,
                  itemBuilder: (context, index) => buildGestureDetector(index),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 600, left: 35),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AddAdress.id);
                },
                child: Text(
                  '                                           + Add new address',
                  style: TextStyle(
                      color: Color(0xff707070),
                      fontFamily: 'Poppins',
                      fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 645, left: 90),
              child: LoginButtonTextSize(
                size: size,
                text: 'Log out',
                textcolour: Color(0xff707070),
                containercolour: Color(0xffF5F5F5),
                buttonHoriz: 80,
                buttonVertical: 15,
                press: () {
                  //log out
                },
                fontSize: 18,
              ),
            )
          ],
        ),
      )),
    );
  }

  _loadPicker(ImageSource source) async {
    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {
      _cropImage(picked);
    }
    Navigator.pop(context);
  }

  _cropImage(File picked) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.red,
        toolbarColor: Colors.red,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio4x3,
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
        _pickedImage = cropped;
      });
    }
  }

  void _showPickedOptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        content: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xffFF0808),
                Color(0xffFFB199),
              ],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                title: Text(
                  "     Take a picture",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      fontSize: 20),
                ),
                onTap: () {
                  _loadPicker(ImageSource.camera);
                },
              ),
              Divider(
                thickness: 0.7,
                color: Colors.white,
              ),
              ListTile(
                title: Text(
                  "   Pick from Gallery",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                      fontSize: 20),
                ),
                onTap: () {
                  _loadPicker(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGestureDetector(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Container(
          height: 170,
          decoration: BoxDecoration(
            color:
                selectedIndex == index ? Color(0xffFF5454) : Color(0xffF0F0F0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 70,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    '${address[index].title}',
                    style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${address[index].door},${address[index].street},\n${address[index].area},\n${address[index].district},${address[index].state}',
                    style: TextStyle(
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.normal),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// _loadPicker(ImageSource source) async {
//   File picked = await ImagePicker.pickImage(source: source);
//   if (picked != null) {
//     _cropImage(picked);
//   }
//   Navigator.pop(context);
// }

// _cropImage(File picked) async {
//   File cropped = await ImageCropper.cropImage(
//     androidUiSettings: AndroidUiSettings(
//       statusBarColor: Colors.red,
//       toolbarColor: Colors.red,
//       toolbarTitle: "Crop Image",
//       toolbarWidgetColor: Colors.white,
//     ),
//     sourcePath: picked.path,
//     aspectRatioPresets: [
//       CropAspectRatioPreset.original,
//       CropAspectRatioPreset.ratio16x9,
//       CropAspectRatioPreset.ratio4x3,
//     ],
//     maxWidth: 800,
//   );
//   if (cropped != null) {
//     setState(() {
//       _pickedImage = cropped;
//     });
//   }
// }

//   void _showPickOptionsDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             ListTile(
//               title: Text("Pick from Gallery"),
//               onTap: () {
//                 _loadPicker(ImageSource.gallery);
//               },
//             ),
//             ListTile(
//               title: Text("Take a pictuer"),
//               onTap: () {
//                 _loadPicker(ImageSource.camera);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
