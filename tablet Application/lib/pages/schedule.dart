import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';

// Change this to fit the PDF file you're using to test.
const String _documentPath = 'assets/pdf/StudentSchedule.pdf';

class schedule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student schedule',
      theme: ThemeData(
        backgroundColor: Colors.red.shade800,
      ),
      home: sch(),
    );
  }
}

class sch extends StatefulWidget {
  sch({Key key}) : super(key: key);

  @override
  _schState createState() => _schState();
}

class _schState extends State<sch> {
  // This moves the PDF file from the assets to a place accessible by our PDF viewer.
  Future<String> prepareTestPdf() async {
    final ByteData bytes =
        await DefaultAssetBundle.of(context).load(_documentPath);
    final Uint8List list = bytes.buffer.asUint8List();

    final tempDir = await getTemporaryDirectory();
    final tempDocumentPath = '${tempDir.path}/$_documentPath';

    final file = await File(tempDocumentPath).create(recursive: true);
    file.writeAsBytesSync(list);
    return tempDocumentPath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        centerTitle: true,
        title: Text("Schedule"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => {
                prepareTestPdf().then((path) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FullPdfViewerScreen(path)),
                  );
                })
              },
              child: const Text('Open schedule'),
            ),
          ],
        ),
      ),
    );
  }
}

class FullPdfViewerScreen extends StatelessWidget {
  final String pdfPath;

  FullPdfViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade800,
          title: Text("My schedule"),
        ),
        path: pdfPath);
  }
}
