import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class picture extends StatefulWidget {
  @override
  _picture createState() => _picture();
}

class _picture extends State<picture> {
  File _file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red.shade800,
          title: Text('picture '),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade800),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(18)),
                        ),
                        child: Text('Take a picture'),
                        onPressed: () {
                          pickercamera();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 500,
                        width: 500,
                        child: Center(
                            child: _file == null
                                ? Text("no image uploaded")
                                : Image.file(_file)),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Future pickercamera() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _file = File(myfile.path);
    });
  }
}
