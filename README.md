# flutter_mediapipe

[Flutter plugin](https://codelabs.developers.google.com/codelabs/write-flutter-plugin/#0) with [mediapipe facemesh](https://google.github.io/mediapipe/solutions/face_mesh). 

## Devices
Currently, it runs on below devices with "OK".
- [OK] [Android](##Android)
- [NG] [iOS](##iOS)

## Android

There are Mediapipe Manual Build to comlete this plugin to run. 
```
This plugin is **not** include jniLib because of package size for flutter publish.
```

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
- Java Library
```
bazel build -c opt --host_crosstool_top=@bazel_tools//tools/cpp:toolchain --fat_apk_cpu=arm64-v8a,armeabi-v7a --strip=ALWAYS //mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe:BUILD
bazel build -c opt --host_crosstool_top=@bazel_tools//tools/cpp:toolchain --fat_apk_cpu=arm64-v8a,armeabi-v7a //mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe:flutter_mediapipe
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
mkdir flutter_mediapipe/android/src/main/jniLibs/arm64-v8a
mkdir flutter_mediapipe/android/src/main/jniLibs/armeabi-v7a
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
cp bazel-out/android-arm64-v8a-opt/bin/_solib_arm64-v8a/_U@android_Uopencv_S_S_Clibopencv_Uarm64-v8a___Uandroid_Uopencv_Ssdk_Snative_Slibs_Sarm64-v8a/libopencv_java3.so flutter_mediapipe/android/src/main/jniLibs/arm64-v8a
cp bazel-out/android-arm64-v8a-opt/bin/mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe/libmediapipe_jni.so flutter_mediapipe/android/src/main/jniLibs/arm64-v8a
cp bazel-out/android-armeabi-v7a-opt/bin/_solib_armeabi-v7a/_U@android_Uopencv_S_S_Clibopencv_Uarmeabi-v7a___Uandroid_Uopencv_Ssdk_Snative_Slibs_Sarmeabi-v7a/libopencv_java3.so flutter_mediapipe/android/src/main/jniLibs/armeabi-v7a
cp bazel-out/android-armeabi-v7a-opt/bin/mediapipe/examples/android/src/java/com/google/mediapipe/apps/flutter_mediapipe/libmediapipe_jni.so flutter_mediapipe/android/src/main/jniLibs/armeabi-v7a

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

### Refferences
- [sample plugin](https://github.com/zhouzaihang/flutter_hand_tracking_plugin) is useful.
- [sample android app without flutter](https://github.com/jiuqiant/mediapipe_multi_hands_tracking_aar_example) 
- [Flutter don't support local AAR](https://github.com/decodedhealth/flutter_zoom_plugin/issues/53)


## iOS
Not implemented. Help me to develop.
