import 'package:clone_app/models/loading.dart';
import 'package:clone_app/screens/afterLogin/feedBase.dart';
import 'package:clone_app/screens/beforeLogin/signUpPage.dart';
import 'package:clone_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  bool load = false;

  final AuthService _auth = AuthService();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  double _txtFldHU = 45.0;
  double _txtFldHP = 45.0;

  final _formKey = GlobalKey<FormState>();

  CollectionReference deref = FirebaseFirestore.instance.collection('Users');

  @override
  Widget build(BuildContext context) {
    return load ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                    child: Image.asset(
                      "./assets/images/logo.png",
                      width: 200.0,
                      height: 100.0,
                      // colorBlendMode: BlendMode.,
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  height: _txtFldHU,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if(value == null || value == ""){
                        setState(() {
                          _txtFldHU = 70.0;
                        });
                        return "Enter Email ID";
                      } else {
                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (emailValid) {
                          setState(() {
                            _txtFldHU = 45.0;
                          });
                          return null;
                        } else {
                          setState(() {
                            _txtFldHU = 70.0;
                          });
                          return "Provide valid Email ID";
                        }
                      }
                    },
                    controller: _username,
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
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
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                  child: TextFormField(
                    obscureText: true,
                    controller: _password,
                    validator: (value) {
                      if(value == null || value == '') {
                        setState(() {
                          _txtFldHP = 70.0;
                        });
                        return "Enter Password";
                      }
                      if(value.length < 6){
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
                      contentPadding: EdgeInsets.fromLTRB(15, 2.5, 0, 2.5),
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
                        borderRadius: BorderRadius.circular(5.0),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Forgot Password?',
                            recognizer: TapGestureRecognizer()..onTap = () {

                            },
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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

                              setState(() {
                                load = true;
                              });

                              dynamic result = await _auth.logInWithUsernameAndPassword(_username.text, _password.text);

                              if(result == null){

                                setState(() {
                                  load = false;
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Check Email ID and Password',
                                    ),
                                  ),
                                );
                              } else {

                                SharedPreferences pref = await SharedPreferences.getInstance();
                                pref.setString('email', _username.text);
                                pref.setString('uid', result);

                                QuerySnapshot Temp = await deref.where('uid', isEqualTo: result).get();
                                Temp.docs.toList().forEach((element) {
                                  pref.setString('docID', element.id);
                                  pref.setString('username', element['username']);
                                  pref.setString('name', element['name']);
                                  pref.setString('bio', element['bio']);
                                  pref.setString('password', element['password']);

                                });

                                setState(() {
                                  load = false;
                                });

                                Navigator.pop(context);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (context) => feedBase(index: 0,)));
                              }
                            }
                          },
                          child: Text(
                            'Log in',
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
                      text: 'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up.',
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signUpPage()));
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
