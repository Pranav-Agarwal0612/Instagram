import 'package:clone_app/models/loading.dart';
import 'package:clone_app/screens/afterLogin/setCaption.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../services/Image.dart';


class uploadPage extends StatefulWidget {
  const uploadPage({Key? key}) : super(key: key);

  @override
  _uploadPageState createState() => _uploadPageState();
}

class _uploadPageState extends State<uploadPage> {

  bool load = false;
  late XFile? image;

  @override
  Widget build(BuildContext context) {
    return load ? Loading() : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text('Upload Posts', style: TextStyle(fontSize: 24, color: Colors.black),),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 40,
                onPressed: () async {
                  ImageServices _imageServices = ImageServices();
                  image = await _imageServices.pickImage();

                  if(image != null){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SetCaption(image: image)));
                    await _imageServices.uploadImage(image);
                  }
                },
                icon: Icon(
                  Icons.add_a_photo_outlined,  
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
