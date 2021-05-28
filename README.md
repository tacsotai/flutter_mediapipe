# flutter_mediapipe

[Flutter plugin](https://codelabs.developers.google.com/codelabs/write-flutter-plugin/#0) with [mediapipe facemesh](https://google.github.io/mediapipe/solutions/face_mesh). 

## Devices
Currently, it runs on below devices with "OK".
- [OK] [Android](##Android)
- [NG] [iOS](##iOS)

## Android

There are Mediapipe Manual Build for Android flutter plugin.

There are [mobile_calculators](https://github.com/google/mediapipe/search?q=mobile_calculators) list to run on Mobile.

Choose one. This plugin choose _**face_mesh**_.
- face_detection
- _**face_mesh**_ 
- object_detection
- hand_tracking

### [Docker](https://google.github.io/mediapipe/getting_started/install.html#installing-using-docker)

```
git clone https://github.com/google/mediapipe.git
cd mediapipe
docker build --tag=mediapipe .
docker run -it --name mediapipe mediapipe:latest
```

When enter docker again:

```
docker start [your container ID] 
docker exec -i -t mediapipe bash
```

Run below commands on the container.

### Setup
```
apt update
apt install vim
apt install zip
bash ./setup_android_sdk_and_ndk.sh
```

### Prepare
```
mkdir mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe
vi mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe/BUILD 
```
- "BUILD" file content.
```
load("//mediapipe/java/com/google/mediapipe:mediapipe_aar.bzl", "mediapipe_aar")

mediapipe_aar(
    name = "flutter_mediapipe",
    calculators = ["//mediapipe/graphs/face_mesh:mobile_calculators"],
)
```

### Build
- jniLibs
```
bazel build -c opt --host_crosstool_top=@bazel_tools//tools/cpp:toolchain --fat_apk_cpu=arm64-v8a,armeabi-v7a --strip=ALWAYS //mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe:BUILD --linkopt="-s"
bazel build -c opt --host_crosstool_top=@bazel_tools//tools/cpp:toolchain --fat_apk_cpu=arm64-v8a,armeabi-v7a //mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe:flutter_mediapipe --linkopt="-s"
```
- binary graph
```
bazel build -c opt --host_crosstool_top=@bazel_tools//tools/cpp:toolchain --fat_apk_cpu=arm64-v8a,armeabi-v7a --strip=ALWAYS //mediapipe/examples/android/src/java/com/google/mediapipe/apps/facemeshgpu:BUILD
bazel build -c opt --host_crosstool_top=@bazel_tools//tools/cpp:toolchain --fat_apk_cpu=arm64-v8a,armeabi-v7a //mediapipe/examples/android/src/java/com/google/mediapipe/apps/facemeshgpu:facemeshgpu
```

### mkdir
```
mkdir flutter_mediapipe/
mkdir flutter_mediapipe/android
mkdir flutter_mediapipe/android/libs
mkdir flutter_mediapipe/android/src
mkdir flutter_mediapipe/android/src/main
mkdir flutter_mediapipe/android/src/main/assets
mkdir flutter_mediapipe/android/src/main/jniLibs
mkdir flutter_mediapipe/protos
```

### libs

```
cp bazel-bin/mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe/libflutter_mediapipe_android_lib.jar flutter_mediapipe/android/libs
```

### assets
```
cp mediapipe/modules/face_detection/face_detection_front.tflite flutter_mediapipe/android/src/main/assets
cp mediapipe/modules/face_landmark/face_landmark.tflite flutter_mediapipe/android/src/main/assets
cp bazel-out/k8-opt/bin/mediapipe/graphs/face_mesh/face_mesh_mobile_gpu.binarypb flutter_mediapipe/android/src/main/assets

```

### jniLibs

```
mkdir work
cp bazel-bin/mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe/flutter_mediapipe.aar work/aar.zip
cd work/
unzip aar.zip
cd ..
cp -r work/jni/* flutter_mediapipe/android/src/main/jniLibs/
```
### protos

```
cp mediapipe/framework/formats/landmark.proto flutter_mediapipe/protos/
```
See [regenerate.md](../protos/regenerate.md)

### Zip


```
zip -r flutter_mediapipe.zip flutter_mediapipe
```

And then, exit from the container.

### Copy
Change "3730fdc4d319" to your container ID.

```
docker cp 3730fdc4d319:/mediapipe/flutter_mediapipe.zip .
unzip flutter_mediapipe.zip
```

Then copy "flutter_mediapipe" to flutter plugin projects.

### [APK](https://flutter.dev/docs/deployment/android#build-an-apk)
```
flutter build apk --split-per-abi
```

### Refferences
- [sample plugin](https://github.com/zhouzaihang/flutter_hand_tracking_plugin) is useful.
- [sample android app without flutter](https://github.com/jiuqiant/mediapipe_multi_hands_tracking_aar_example) 
- [Flutter don't support local AAR](https://github.com/decodedhealth/flutter_zoom_plugin/issues/53)
- [jniLibs size down](https://github.com/google/mediapipe/issues/77)


## iOS
Not implemented. Help me to develop.


## Custormize mediapipe

### Graph
When editing graphs or subgraphs, [Build](###Build) again. 
- graphs: _binary graph_
- subgraphs: _jniLibs_


```
vi mediapipe/graphs/face_mesh/subgraphs/face_renderer_gpu.pbtxt
```
It is a sample to comment out of lines from 92 to 94 for hiding rectangles and landmarks.
```
# Draws annotations and overlays them on top of the input images.
node {
  calculator: "AnnotationOverlayCalculator"
  input_stream: "IMAGE_GPU:input_image"
#  input_stream: "detections_render_data"
#  input_stream: "VECTOR:0:multi_face_landmarks_render_data"
#  input_stream: "rects_render_data"
  output_stream: "IMAGE_GPU:output_image"
}
```
