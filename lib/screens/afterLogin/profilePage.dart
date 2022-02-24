import 'package:clone_app/screens/afterLogin/changePassword.dart';
import 'package:clone_app/screens/afterLogin/feedBase.dart';
import 'package:clone_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'editProfile.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {

  final AuthService _auth = AuthService();
  bool profilePicPresent = false;
  String? profilePicLink;

  String dropDownValue ='';
  String personName ='';
  String personBio ='';

  List dropValues =[];

  @override
  void initState(){
    initialise();
    super.initState();
  }

  void initialise() async{

    SharedPreferences pref = await SharedPreferences.getInstance();

    if(!profilePicPresent) {
      await FirebaseStorage.instance.ref().child(
          'photos/${pref.getString('username')}')
          .child('profile')
          .getDownloadURL()
          .then((value) {
        setState(() {
          profilePicLink = value;
          profilePicPresent = true;
        });
      }).catchError((e, stackTrace) async {
        print(e);
      });
    }

    setState(() {
      dropDownValue = pref.getString('username')!;
      personName = pref.getString('name')!;
      personBio = pref.getString('bio')!;

      dropValues.add(pref.getString('username')!);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Icon(
                Icons.lock,
                size: 20,
                color: Colors.black,
              ),
            ),
            Container(
              width: 10,
            ),
            Container(
              child: DropdownButton(
                underline: Container(
                  height: 0,
                  color: Colors.grey.shade50,
                ),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 20,
                ),
                value: dropDownValue,
                onChanged: (newValue) {
                  setState(() {
                    dropDownValue = newValue.toString();
                  });
                },
                items: dropValues.map((val) {
                  return DropdownMenuItem(
                    child: Text(
                      val,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    value: val,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () async{
              _auth.signOut(context);
            },

            child: Text(
              'LOGOUT',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 44,
                      child: CircleAvatar(
                        radius: 43,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: profilePicPresent
                              ? NetworkImage(profilePicLink!)
                              : AssetImage('assets/images/default.png') as ImageProvider,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    personName,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    personBio,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end ,
              mainAxisAlignment: MainAxisAlignment.center    ,
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    height: 38,
                    margin: EdgeInsets.fromLTRB(18, 15, 8, 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        width: 1.2,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                    ),
                    child: ButtonTheme(
                      height: 40,
                      child: TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => editProfile()));
                          setState(() {
                            feedBase(index: 4);
                          });
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child: Container(
                    height: 38,
                    margin: EdgeInsets.fromLTRB(8, 15, 18, 15),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        width: 1.2,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                    ),
                    child: ButtonTheme(
                      height: 35,
                      child: TextButton.icon(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => changePassword()));
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.black87,
                        ),
                        label: Text(
                          '',
                          style: TextStyle(
                            fontSize: 0.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // FutureBuilder(
            //   future: FirebaseFirestore.instance.collection('Pictures').snapshots().toList(),
            //   builder: (context, AsyncSnapshot snapshot) {
            //     return GridView.builder(
            //       itemCount: snapshot.data.length,
            //       itemBuilder (): ,
            //     )
            //   },
            // )
          ],
        ),
      ),
    );
  }
}

