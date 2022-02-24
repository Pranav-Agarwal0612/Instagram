import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' as i;
import 'package:intl/intl.dart';

class ImageServices{

  Future<XFile?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<XFile?> captureImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future<void> uploadImage(XFile? image) async {

      SharedPreferences pref = await SharedPreferences.getInstance();

      DateTime now = DateTime.now();
      String fileName = DateFormat('yyyyMMdd-kkmmss').format(now);
      fileName += "-";
      fileName += (pref.getString('username'))!;

      pref.setString('LatestUpload', fileName);

      await FirebaseStorage.instance
          .ref()
          .child("photos")
          .child(pref.getString("username")!)
          .child(fileName)
          .putFile(i.File(image!.path));


      await FirebaseFirestore.instance.collection('Pictures').doc(fileName).set({
        'username' : pref.getString('username'),
        'link': await FirebaseStorage.instance.ref().child("photos").child(pref.getString("username")!).child(fileName).getDownloadURL(),
        'date-time' : fileName.substring(0,15),
        'likes': 0,
      });
  }

  Future<void> setCaption(String? caption) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    await FirebaseFirestore.instance.collection('Pictures').doc(pref.getString('LatestUpload')!).update({
      'caption' : caption,
    });
  }
}