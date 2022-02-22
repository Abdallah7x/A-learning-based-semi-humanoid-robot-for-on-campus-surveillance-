import 'dart:io';

class FileManager {
  writeTextFile() {
    var file = File('file.txt');
    var sink = file.openWrite();
    sink.write('hiiiii');
    sink.close();
  }
}
