import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vacanza/helper/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  User? user =  FirebaseAuth.instance.currentUser;
  File? _image;
  Future getImage(ImageSource source) async{
    final image = await ImagePicker().pickImage(source: source);
    if(image == null) return;
    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          title: Text(
            "Profile",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(179, 157, 154, 154),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.account_circle, color: Colors.green, size: 30),
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 7),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: _image != null
                            ?Image.file(
                            _image!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                          : Image.network(
                            "https://s-light.tiket.photos/t/01E25EBZS3W0FY9GTG6C42E1SE/rsfit19201280gsm/events/2021/06/25/19684f9d-27c1-402f-8402-fc850c0f7c73-1624599423067-8fcd2f0c7970d4bbd80d36b647c33bad.jpg",
                            fit: BoxFit.cover,
                            height: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 38.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            user?.displayName ?? '',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Email",
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Change'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                fixedSize: const Size(95, 95),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.grey)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Container(
                  height: 60,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Password",
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Change'),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.green,
                                fixedSize: const Size(95, 95),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(width: 1.0, color: Colors.grey)),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                child: Column(children: [
                  SizedBox(height: 40),
                  CustomButton(
                      title: 'pick from gallery',
                      icon: Icons.image_outlined,
                      onClick: ()=> getImage(ImageSource.gallery),
                  ),
                  CustomButton(
                      title: 'pick from camera',
                      icon: Icons.camera,
                      onClick: ()=>getImage(ImageSource.camera),
                  ),
                ],
                ),



              )
            ],
          ),
        ));
  }
}

Widget CustomButton({
  required String title,
  required IconData icon,
  required VoidCallback onClick,
}) {
  return Container(
    width: 280,
    child: ElevatedButton(
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon),
          Text(title)
        ],),),
  );
}


