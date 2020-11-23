import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:travel_ex/dbconnect/model.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  final _controllertitle = TextEditingController();
  final _controllerdesc = TextEditingController();
  String name = "";
  Box AddBox;
  File _image;
  String base64;
  final picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AddBox = Hive.box('adventure');
  }

  void addMemory(Model model) {
    Hive.box('adventure').add(model);
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        final bytes = File(_image.path).readAsBytesSync();
        base64 = base64Encode(bytes);
      } else {
        print('No image selected.');
      }
    });
  }

  Future addAdventure(String title, String description, String image) {
    //  Automated Stuff
    //  Get the Current Date
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String date = formatter.format(now);
    //  Get the Current Location

    final location = "asdf";

    //  Add to DB
    final newAdventure = Model(title, date, location, image, description);
    AddBox.add(newAdventure);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add A New Adventure"),
        ),
        body: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: _image == null
                  ? Text("No Image Selected")
                  : Image(
                      height: 200,
                      width: 200,
                      fit: BoxFit.contain,
                      image: FileImage(_image)),
            ),
            IconButton(
              onPressed: getImage,
              icon: Icon(Icons.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _controllertitle,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "Name your Adventure",
                      filled: true,
                      fillColor: Colors.grey[200])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: _controllerdesc,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      hintText: "Describe it",
                      filled: true,
                      fillColor: Colors.grey[200])),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                label: Text("Add Adventure"),
                onPressed: () {
                  final title = _controllertitle.text;
                  final desc = _controllerdesc.text;

                  //Validation to make sure the Title and Description is not Empty
                  if (title != "" && desc != "") {
                    //  If not empty
                    addAdventure(title, desc, base64);

                    Fluttertoast.showToast(
                        msg: "Added Memory",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    Navigator.pop(context);
                  } else {
                    Fluttertoast.showToast(
                        msg: "Don't be Shy",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },
              ),
            ),
          ]),
        ));
  }
}

//TODO

// Design: Add a TextBox to write about the Adventure-Done
//         Add an Image view such that the user can add a certain image
//         Add an option to add the location
//
// Implementation: On Submit, add the details to the SQLLite DB
//     Implement a way to add image to DB
//     Get the location on button click
//     Get the system current time and date
