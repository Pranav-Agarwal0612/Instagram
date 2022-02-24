import 'package:clone_app/models/loading.dart';
import 'package:clone_app/screens/beforeLogin/loginPage.dart';
import 'package:clone_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'createProfile.dart';

class signUpPage extends StatefulWidget {

  @override
  _signUpPageState createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {

  bool load = false;

  final AuthService _auth = AuthService();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _username = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  double _txtFldH = 45.0;
  double _txtFldHE = 45.0;
  double _txtFldHU = 45.0;
  double _txtFldHP = 45.0;

  CollectionReference deRef = FirebaseFirestore.instance.collection('Users');


  @override
  Widget build(BuildContext context) {
    return load ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 35,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 40),
                  child: Image.asset(
                    "./assets/images/logo.png",
                    width: 170.0,
                    height: 80.0,
                  ),
                ),
              ),
              Center(
                child: Container(
                  height: _txtFldHU,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    controller: _username,
                    validator: (value) {
                      if (value == null || value == '') {
                        setState(() {
                          _txtFldHU = 70.0;
                        });
                        return "Enter Username";
                      }
                      setState(() {
                        _txtFldHU = 45.0;
                      });
                      return null;
                    },
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
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.5,
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
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      hintText: 'Password',
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
                          color: Colors.grey.shade400,
                          width: 1.5,
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
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                          color: Colors.grey.shade400,
                          width: 1.5,
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
              Center(
                child: Container(
                  height: _txtFldHE,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value == null || value == "") {
                        setState(() {
                          _txtFldHE = 70.0;
                        });
                        return "Enter Email ID";
                      } else {
                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (emailValid) {
                          setState(() {
                            _txtFldHE = 45.0;
                          });
                          return null;
                        } else {
                          setState(() {
                            _txtFldHE = 70.0;
                          });
                          return "Provide valid Email ID";
                        }
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Email ID',
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
                          color: Colors.grey.shade400,
                          width: 1.5,
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
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6.0),
                        color: Colors.blue,
                      ),
                      child: ButtonTheme(
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {

                              setState(() {
                                load = true;
                              });
                              dynamic result = await _auth
                                  .signUpWithEmailAndPassword(
                                  _email.text, _password.text);
                              if (result != null) {

                                setState(() {
                                  load = false;
                                });

                                SharedPreferences pref = await SharedPreferences.getInstance();
                                pref.setString('email', _email.text);
                                pref.setString('uid', result);
                                pref.setString('password', _password.text);


                                Navigator.pop(context);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (context) => createProfile(uname: _username.text,)));
                              } else {
                                setState(() {
                                  load = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Email already in use',
                                    ),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            'Sign Up',
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
              Container(
                height: 70,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 42, 0, 90),
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Log in.',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (context) => loginPage()));
                            },
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(),
              Center(
                child: Container(
                  child: Text(
                    'Instagram of Facebook',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
