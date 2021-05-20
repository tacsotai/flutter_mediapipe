import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mediapipe/gen/landmark.pb.dart';

class FlutterMediapipe {
  final MethodChannel _methodChannel;
  final EventChannel _eventChannel;

  FlutterMediapipe()
      : _methodChannel = MethodChannel("sotai.co/flutter_mediapipe"),
        _eventChannel = EventChannel("sotai.co/flutter_mediapipe_event");

  Future<String> get platformVersion async =>
      await _methodChannel.invokeMethod("getPlatformVersion");

  Stream<NormalizedLandmarkList> get landMarksStream async* {
    yield* _eventChannel
        .receiveBroadcastStream()
        .map((buffer) => NormalizedLandmarkList.fromBuffer(buffer));
  }
}

const NAMESPACE = "plugins.sotai.co/flutter_mediapipe";

typedef void NativeViewCreatedCallback(FlutterMediapipe controller);

class NativeView extends StatelessWidget {
  const NativeView({required this.onViewCreated});

  final NativeViewCreatedCallback onViewCreated;

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return AndroidView(
          viewType: "flutter_mediapipe/view",
          onPlatformViewCreated: (int id) => onViewCreated(FlutterMediapipe()),
        );
      case TargetPlatform.fuchsia:
      case TargetPlatform.iOS:
      default:
        throw UnsupportedError(
            "Trying to use the default webview implementation for"
            " $defaultTargetPlatform but there isn't a default one");
    }
  }
}
