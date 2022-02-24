import 'package:clone_app/screens/afterLogin/feedBase.dart';
import 'package:clone_app/screens/beforeLogin/newAppPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState(){
    isLoggedin();
    super.initState();
  }

  bool logged = false;

  Future<void> isLoggedin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');

    if(email == null){

    }else{
      setState(() {
        logged = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if(logged){
      return feedBase(index: 0,);
    }else{
      return newAppPage();
    }
  }
}
