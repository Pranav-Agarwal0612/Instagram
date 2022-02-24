import 'package:flutter/material.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  _searchPageState createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Container(
            height: 35,
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: TextField(
              textAlignVertical: TextAlignVertical.top,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: ' Search',
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                fillColor: Colors.grey.shade300,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Image.asset(
                './assets/images/icons/Live.png',
                color: Colors.black,
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey.shade50),
                elevation: MaterialStateProperty.all(0),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        child: SizedBox(
                          height: 35,
                          width: 100,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.palette_rounded,
                              color: Colors.black,
                              size: 16,
                            ),
                            label: Text(
                              'Art',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 0.5,
                                color: Colors.black,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              elevation: 0.0,
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        child: SizedBox(
                          height: 35,
                          width: 100,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.airplanemode_active,
                              color: Colors.black,
                              size: 16,
                            ),
                            label: Text(
                              'Travel',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 0.5,
                                color: Colors.black,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              elevation: 0.0,
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        child: SizedBox(
                          height: 35,
                          width: 100,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.shopping_bag_rounded,
                              color: Colors.black,
                              size: 16,
                            ),
                            label: Text(
                              'Shop',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 0.5,
                                color: Colors.black,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              elevation: 0.0,
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: SizedBox(
                          height: 35,
                          width: 130,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.black,
                              size: 16,
                            ),
                            label: Text(
                              'Photography',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              side: BorderSide(
                                width: 0.5,
                                color: Colors.black,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              elevation: 0.0,
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        child: SizedBox(
                          height: 35,
                          width: 100,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.cake,
                              color: Colors.black,
                              size: 16,
                            ),
                            label: Text(
                              'Baking',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 13,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 2),
                              side: BorderSide(
                                width: 0.5,
                                color: Colors.black,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              elevation: 0.0,
                              primary: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
