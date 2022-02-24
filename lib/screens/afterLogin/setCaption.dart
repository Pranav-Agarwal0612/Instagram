import 'dart:io' as i;
import 'package:clone_app/services/Image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SetCaption extends StatefulWidget {
  final XFile? image;

  const SetCaption({
    Key? key,
    required this.image
  }) : super(key: key);

  @override
  _SetCaptionState createState() => _SetCaptionState();
}

class _SetCaptionState extends State<SetCaption> {

  ImageServices _imageServices = ImageServices();

  TextEditingController _caption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(20, 60, 20, 30),
              child: Image.file(
                i.File((widget.image)!.path),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.top,
                  controller: _caption,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Caption',
                    hintStyle: TextStyle(
                      fontSize: 14.5,
                      color: Colors.grey.shade400,
                    ),
                    contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    fillColor: Colors.grey.shade50,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 1.5,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                ),
                style: ButtonStyle(

                ),
                onPressed: () {
                  Navigator.pop(context);
                  _imageServices.setCaption(_caption.text);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Uploaded Successfully'),),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
