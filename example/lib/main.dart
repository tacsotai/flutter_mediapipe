import 'package:flutter/material.dart';

import 'package:flutter_mediapipe/flutter_mediapipe.dart';
import 'package:flutter_mediapipe/gen/landmark.pb.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Mediapipe'),
        ),
        body: Container(
            child: NativeView(
                onViewCreated: (FlutterMediapipe c) => setState(() {
                      c.landMarksStream.listen(_onLandMarkStream);
                      c.platformVersion.then((content) => print(content));
                    }))),
      ),
    );
  }

  void _onLandMarkStream(NormalizedLandmarkList landmarkList) {
    landmarkList.landmark.asMap().forEach((int i, NormalizedLandmark value) {
      print('Index: $i \n' + '$value');
    });
  }
}
