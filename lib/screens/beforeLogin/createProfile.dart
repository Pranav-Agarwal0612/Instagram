import 'package:clone_app/screens/afterLogin/feedBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider_windows/path_provider_windows.dart';

class createProfile extends StatefulWidget {
  const createProfile({Key? key, required this.uname}) : super(key: key);
  final String uname;

  @override
  _createProfileState createState() => _createProfileState();
}


class _createProfileState extends State<createProfile> {


  double _txtFldHU = 45.0;
  double _txtFldHU2 = 45.0;


  TextEditingController _name = TextEditingController();
  TextEditingController _bio = TextEditingController();
  TextEditingController _username = TextEditingController();

  @override
  void initState() {
    super.initState();

    _username = TextEditingController(text: widget.uname);
  }


  CollectionReference dbref = FirebaseFirestore.instance.collection('Users');
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            '  Create Account',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,

        ),
        body: Form(
          key: _formKey,
          child: Column(children: [
            Center(
              child: Container(
                height: _txtFldHU,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value == "") {
                      setState(() {
                        _txtFldHU = 70.0;
                      });
                      return "Enter Name";
                    } else {
                      setState(() {
                        _txtFldHU = 45.0;
                      });
                      return null;
                    }
                  },
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1.5,
                      ),
                    ),
                    errorStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                height: _txtFldHU2,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value == "") {
                      setState(() {
                        _txtFldHU2 = 70.0;
                      });
                      return "Enter Username";
                    } else {
                      setState(() {
                        _txtFldHU2 = 45.0;
                      });
                      return null;
                    }
                  },
                  controller: _username,
                  decoration: InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1.5,
                      ),
                    ),
                    errorStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.red.shade700,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  controller: _bio,
                  maxLines: null,
                  expands: true,
                  decoration: InputDecoration(
                    hintText: 'Bio',
                    hintStyle: TextStyle(
                      fontSize: 13.5,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors  .grey.shade400,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center    ,
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.blue,
                    ),
                    child: ButtonTheme(
                      child: TextButton(
                        onPressed: () async {
                          if(_formKey.currentState!.validate()){
                            int num = await dbref.where('username', isEqualTo: _username.text).get().then((value) => value.docs.length);

                            if(num != 0){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(
                                  'Username already in use',
                                ))
                              );
                            } else {

                              SharedPreferences pref = await SharedPreferences.getInstance();
                              pref.setString('username', _username.text);
                              pref.setString('bio', _bio.text);
                              pref.setString('name', _name.text);


                              dynamic docID;

                              await dbref.add({
                                'username': pref.getString('username'),
                                'name': pref.getString('name'),
                                'bio': pref.getString('bio'),
                                'email': pref.getString('email'),
                                'uid': pref.getString('uid'),
                                'password': pref.getString('password'),
                              }).then((value) => docID=value);

                              if(docID != null) pref.setString('docID', docID.id);
                              print(docID.id);

                              // await FirebaseStorage.instance.ref().child('photos').child(pref.getString('docID')!).child('profile').putFile(await getImageFileFromAssets('images/default.png'));

                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => feedBase(index: 0,)));
                            }
                          }
                        },
                        child: Text(
                          'SAVE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Future<File> getImageFileFromAssets(String path) async {
//   final byteData = await rootBundle.load('assets/$path');
//   PathProviderWindows pathProviderWindows = new PathProviderWindows();
//
//   final file = File('${(await pathProviderWindows.getTemporaryPath())}/$path');
//   await file.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
//
//   return file;
// }