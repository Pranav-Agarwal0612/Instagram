import 'package:clone_app/screens/beforeLogin/newAppPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future logInWithUsernameAndPassword(_email, _password) async {
    try{
      UserCredential result = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      User? user = result.user;
      if(user == null){
        return null;
      } else {
        return user.uid;
      }
    } catch (e) {
      return null;
    }
  }

  Future signUpWithEmailAndPassword(_email, _password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      User? user = result.user;
      if(user == null){
        return null;
      } else {
        return user.uid;
      }
    } catch (e){
      return null;
    }
  }

  Future<void> signOut(BuildContext context) async {

    await _auth.signOut().then((value) async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove('email');
      pref.remove('username');
      pref.remove('uid');
      pref.remove('name');
      pref.remove('bio');
      pref.remove('docID');
      pref.remove('LatestUpload');
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => newAppPage()));
    });
  }

}