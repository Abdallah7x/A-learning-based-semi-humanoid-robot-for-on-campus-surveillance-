import 'dart:typed_data';

import 'package:CWCFlutter/file_manager.dart';
import 'package:CWCFlutter/model/user.dart';
import 'package:flutter/material.dart';

class FileController extends ChangeNotifier {
  String _text = '';
  User _user;
  Uint8List _imageByteList;

  String get text => _text;
  User get user => _user;
  Uint8List get imageByteList => _imageByteList;

  writeText() async {
    _text = await FileManager().writeTextFile();
    notifyListeners();
  }
}
