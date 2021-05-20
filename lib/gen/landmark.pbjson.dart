///
//  Generated code. Do not modify.
//  source: landmark.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use landmarkDescriptor instead')
const Landmark$json = const {
  '1': 'Landmark',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
    const {'1': 'z', '3': 3, '4': 1, '5': 2, '10': 'z'},
    const {'1': 'visibility', '3': 4, '4': 1, '5': 2, '10': 'visibility'},
    const {'1': 'presence', '3': 5, '4': 1, '5': 2, '10': 'presence'},
  ],
};

/// Descriptor for `Landmark`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List landmarkDescriptor = $convert.base64Decode('CghMYW5kbWFyaxIMCgF4GAEgASgCUgF4EgwKAXkYAiABKAJSAXkSDAoBehgDIAEoAlIBehIeCgp2aXNpYmlsaXR5GAQgASgCUgp2aXNpYmlsaXR5EhoKCHByZXNlbmNlGAUgASgCUghwcmVzZW5jZQ==');
@$core.Deprecated('Use landmarkListDescriptor instead')
const LandmarkList$json = const {
  '1': 'LandmarkList',
  '2': const [
    const {'1': 'landmark', '3': 1, '4': 3, '5': 11, '6': '.mediapipe.Landmark', '10': 'landmark'},
  ],
};

/// Descriptor for `LandmarkList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List landmarkListDescriptor = $convert.base64Decode('CgxMYW5kbWFya0xpc3QSLwoIbGFuZG1hcmsYASADKAsyEy5tZWRpYXBpcGUuTGFuZG1hcmtSCGxhbmRtYXJr');
@$core.Deprecated('Use normalizedLandmarkDescriptor instead')
const NormalizedLandmark$json = const {
  '1': 'NormalizedLandmark',
  '2': const [
    const {'1': 'x', '3': 1, '4': 1, '5': 2, '10': 'x'},
    const {'1': 'y', '3': 2, '4': 1, '5': 2, '10': 'y'},
    const {'1': 'z', '3': 3, '4': 1, '5': 2, '10': 'z'},
    const {'1': 'visibility', '3': 4, '4': 1, '5': 2, '10': 'visibility'},
    const {'1': 'presence', '3': 5, '4': 1, '5': 2, '10': 'presence'},
  ],
};

/// Descriptor for `NormalizedLandmark`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List normalizedLandmarkDescriptor = $convert.base64Decode('ChJOb3JtYWxpemVkTGFuZG1hcmsSDAoBeBgBIAEoAlIBeBIMCgF5GAIgASgCUgF5EgwKAXoYAyABKAJSAXoSHgoKdmlzaWJpbGl0eRgEIAEoAlIKdmlzaWJpbGl0eRIaCghwcmVzZW5jZRgFIAEoAlIIcHJlc2VuY2U=');
@$core.Deprecated('Use normalizedLandmarkListDescriptor instead')
const NormalizedLandmarkList$json = const {
  '1': 'NormalizedLandmarkList',
  '2': const [
    const {'1': 'landmark', '3': 1, '4': 3, '5': 11, '6': '.mediapipe.NormalizedLandmark', '10': 'landmark'},
  ],
};

/// Descriptor for `NormalizedLandmarkList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List normalizedLandmarkListDescriptor = $convert.base64Decode('ChZOb3JtYWxpemVkTGFuZG1hcmtMaXN0EjkKCGxhbmRtYXJrGAEgAygLMh0ubWVkaWFwaXBlLk5vcm1hbGl6ZWRMYW5kbWFya1IIbGFuZG1hcms=');
