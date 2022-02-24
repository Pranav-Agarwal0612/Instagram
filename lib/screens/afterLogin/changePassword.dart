
import 'dart:developer';

import 'package:clone_app/models/loading.dart';
import 'package:clone_app/screens/afterLogin/feedBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class changePassword extends StatefulWidget {
  const changePassword({Key? key}) : super(key: key);

  @override
  _changePasswordState createState() => _changePasswordState();
}

class _changePasswordState extends State<changePassword> {
  double _txtFldH = 45.0;
  double _txtFldHP = 45.0;
  double _txtFldHoP = 45.0;

  CollectionReference dbref = FirebaseFirestore.instance.collection('Users');

  TextEditingController _password = TextEditingController();
  TextEditingController _opassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Change Password',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: (isLoading) ? Loading() : Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                height: _txtFldHoP,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: TextFormField(
                  controller: _opassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value == '') {
                      setState(() {
                        _txtFldHoP = 70.0;
                      });
                      return "Enter Old Password";
                    }
                    if (value.length < 6) {
                      setState(() {
                        _txtFldHoP = 70.0;
                      });
                      return "Password should be atleast 6 characters long";
                    }
                    setState(() {
                      _txtFldHoP = 45.0;
                    });
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Old Password',
                    hintStyle: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
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
                height: _txtFldHP,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: TextFormField(
                  controller: _password,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value == '') {
                      setState(() {
                        _txtFldHP = 70.0;
                      });
                      return "Enter Password";
                    }
                    if (value.length < 6) {
                      setState(() {
                        _txtFldHP = 70.0;
                      });
                      return "Password should be atleast 6 characters long";
                    }
                    setState(() {
                      _txtFldHP = 45.0;
                    });
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'New Password',
                    hintStyle: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
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
                height: _txtFldH,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: TextFormField(
                  obscureText: true,
                  controller: _confirmPassword,
                  validator: (value) {
                    if (_password.text != value) {
                      setState(() {
                        _txtFldH = 70.0;
                      });
                      return "Passwords do not match";
                    } else {
                      setState(() {
                        _txtFldH = 45.0;
                      });
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
                    hintStyle: TextStyle(
                      fontSize: 12.5,
                      color: Colors.grey.shade400,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 0.5*2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1.5,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.red.shade700,
                        width: 1.5,
                      ),
                    ),
                    errorStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.red.shade700,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.fromLTRB(20, 12, 10, 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                    child: ButtonTheme(
                      child: TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.fromLTRB(10, 12, 20, 12),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.blue,
                    ),
                    child: ButtonTheme(
                      child: TextButton(
                        onPressed: () async {

                          setState(() {
                            isLoading = true;
                          });

                          SharedPreferences pref = await SharedPreferences.getInstance();

                          if(_formKey.currentState!.validate()){

                            setState(() {
                              isLoading = false;
                            });

                            if(_opassword.text != pref.getString('password')){
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Old Password is incorrect')),
                              );
                            } else {
                              final FirebaseAuth _auth = FirebaseAuth.instance;
                              User currUser = _auth.currentUser!;

                              setState(() {
                                isLoading = false;
                              });

                              currUser.updatePassword(_password.text).then((value){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Password changed successfully')),
                                );
                                pref.setString('password', _password.text);
                                log(pref.getString('password')!);
                                dbref.doc(pref.getString('docID')).update({
                                  'password': pref.getString('password'),
                                });
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => feedBase(index: 4)));
                              }).catchError((onError){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('$onError')),
                                );
                              });
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
