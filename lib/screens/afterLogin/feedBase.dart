import 'package:clone_app/screens/afterLogin/uploadPage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homePage.dart';
import 'profilePage.dart';
import 'searchPage.dart';

class feedBase extends StatefulWidget {
  const feedBase({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  _feedBaseState createState() => _feedBaseState();
}

class _feedBaseState extends State<feedBase> {

  String? profilePicLink;
  bool profilePicPresent = false;

  int _currentIndex = 0;

  @override
  void initState(){
    super.initState();
    initialise();
    _currentIndex = widget.index;
  }

  Future<void> initialise() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await FirebaseStorage.instance.ref().child('photos/${pref.getString('username')}').child('profile').getDownloadURL().then((value) {
      setState(() {
        profilePicLink = value;
        profilePicPresent = true;
      });
    }).catchError((e, stackTrace) async {
      print(e);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
                './assets/images/icons/Home.png'
            ),
            activeIcon: Image.asset(
                './assets/images/icons/Home_filled.png'
            ),
            label: "",

          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                './assets/images/icons/Search.png'
            ),
            activeIcon: Image.asset(
                './assets/images/icons/Search_filled.png'
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                './assets/images/icons/plus.png'
            ),
            activeIcon: Image.asset(
                './assets/images/icons/plus.png'
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
                './assets/images/icons/Like.png'
            ),
            activeIcon: Image.asset(
                './assets/images/icons/Like_filled_black.png'
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: profilePicPresent ? NetworkImage(profilePicLink!) : AssetImage('assets/images/default.png') as ImageProvider,
              radius: 15,
            ),
            activeIcon: CircleAvatar(
              backgroundColor: Colors.black,
              radius: 17,
              child: CircleAvatar(
                backgroundImage: profilePicPresent ? NetworkImage(profilePicLink!) : AssetImage('assets/images/default.png') as ImageProvider,
                radius: 15,
              ),
            ),
            label: "",
          ),
        ],
        onTap: (indd){
          setState(() {
            if(indd != 3) _currentIndex = indd;
          });
        },
      ),
    );
  }
}

List tabs = [
  homePage(),
  searchPage(),
  uploadPage(),
  homePage(),
  profilePage()
];

