import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class picture extends StatefulWidget {
  @override
  _picture createState() => _picture();
}

class _picture extends State<picture> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red.shade800),
                        ),
                        child: Text('Take picture'),
                        onPressed: () {
                          pickercamera();
                        },
                      ),
                      Center(
                          child: file == null
                              ? Text("no image uploaded")
                              : Text("uploaded")),
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
      file = File(myfile!.path);
    });
  }
}
