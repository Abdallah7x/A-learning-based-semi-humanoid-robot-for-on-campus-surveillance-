import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:tablet/pages/cam2.dart';

class cam extends StatelessWidget {
  const cam({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await availableCameras().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => cam2(
                    cameras: value,
                  ),
                ),
              ),
            );
          },
          child: const Text('Start'),
        ),
      ),
    );
  }
}
