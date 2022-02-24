import 'package:clone_app/models/Card.dart';
import 'package:clone_app/models/loading.dart';
import 'package:clone_app/screens/afterLogin/setCaption.dart';
import 'package:clone_app/services/Image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as i;
import 'package:intl/intl.dart';


class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  bool load = false;

  String username = 'i';

  void initState()  {
    initialise();
    super.initState();
  }

  Future<void> initialise() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username')!;
    });
  }



  @override
  Widget build(BuildContext context) {
    return load ? Loading() : Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade50,
        leading: ElevatedButton(
          onPressed: () async {

            ImageServices _imageServices = ImageServices();
            XFile? image = await _imageServices.captureImage();

            if(image != null){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SetCaption(image: image)));
              await _imageServices.uploadImage(image);
            }
          },
          child: Image.asset('./assets/images/icons/Camera Icon.png'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.grey.shade50),
            elevation: MaterialStateProperty.all(0),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 6),
          child: Image.asset(
            './assets/images/logo.png',
            height: 40,
            width: 100,
          ),
        ),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {

            },
            child: Image.asset('./assets/images/icons/Messanger.png'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey.shade50),
              elevation: MaterialStateProperty.all(0),
            ),
          ),
        ],
      ),
      body: StreamBuilder (
        stream: FirebaseFirestore.instance.collection('Pictures').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: snapshot.data!.docs.map((e) {
              if(e['username'] != username){
                return imageCard(e, context);
              } else {
                return Container(height: 0,);
              }
            }).toList().reversed.toList(),
          );
        },
      ),
    );
  }
}
