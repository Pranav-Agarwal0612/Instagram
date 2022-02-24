import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginPage.dart';
import 'signUpPage.dart';

class newAppPage extends StatefulWidget {
  @override
  _newAppPageState createState() => _newAppPageState();
}

class _newAppPageState extends State<newAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(60, 170, 60, 140),
                  child: Image.asset(
                    "./assets/images/logo.png",
                    width: 210.0,
                    height: 100.0,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 25),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.blue,
                    ),
                    child: ButtonTheme(
                      height: 35,
                      minWidth: 330,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => loginPage()));
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        width: 1.2,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                    ),
                    child: ButtonTheme(
                      height: 35,
                      minWidth: 330,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => signUpPage()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
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
