///
//  Generated code. Do not modify.
//  source: landmark.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Landmark extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Landmark', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mediapipe'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OF)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OF)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'z', $pb.PbFieldType.OF)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'visibility', $pb.PbFieldType.OF)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'presence', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  Landmark._() : super();
  factory Landmark({
    $core.double? x,
    $core.double? y,
    $core.double? z,
    $core.double? visibility,
    $core.double? presence,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (z != null) {
      _result.z = z;
    }
    if (visibility != null) {
      _result.visibility = visibility;
    }
    if (presence != null) {
      _result.presence = presence;
    }
    return _result;
  }
  factory Landmark.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Landmark.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Landmark clone() => Landmark()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Landmark copyWith(void Function(Landmark) updates) => super.copyWith((message) => updates(message as Landmark)) as Landmark; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Landmark create() => Landmark._();
  Landmark createEmptyInstance() => create();
  static $pb.PbList<Landmark> createRepeated() => $pb.PbList<Landmark>();
  @$core.pragma('dart2js:noInline')
  static Landmark getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Landmark>(create);
  static Landmark? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get z => $_getN(2);
  @$pb.TagNumber(3)
  set z($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get visibility => $_getN(3);
  @$pb.TagNumber(4)
  set visibility($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVisibility() => $_has(3);
  @$pb.TagNumber(4)
  void clearVisibility() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get presence => $_getN(4);
  @$pb.TagNumber(5)
  set presence($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPresence() => $_has(4);
  @$pb.TagNumber(5)
  void clearPresence() => clearField(5);
}

class LandmarkList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LandmarkList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mediapipe'), createEmptyInstance: create)
    ..pc<Landmark>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'landmark', $pb.PbFieldType.PM, subBuilder: Landmark.create)
    ..hasRequiredFields = false
  ;

  LandmarkList._() : super();
  factory LandmarkList({
    $core.Iterable<Landmark>? landmark,
  }) {
    final _result = create();
    if (landmark != null) {
      _result.landmark.addAll(landmark);
    }
    return _result;
  }
  factory LandmarkList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LandmarkList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LandmarkList clone() => LandmarkList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LandmarkList copyWith(void Function(LandmarkList) updates) => super.copyWith((message) => updates(message as LandmarkList)) as LandmarkList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LandmarkList create() => LandmarkList._();
  LandmarkList createEmptyInstance() => create();
  static $pb.PbList<LandmarkList> createRepeated() => $pb.PbList<LandmarkList>();
  @$core.pragma('dart2js:noInline')
  static LandmarkList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LandmarkList>(create);
  static LandmarkList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Landmark> get landmark => $_getList(0);
}

class LandmarkLists extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'LandmarkLists', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mediapipe'), createEmptyInstance: create)
    ..pc<LandmarkList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'landmarks', $pb.PbFieldType.PM, subBuilder: LandmarkList.create)
    ..hasRequiredFields = false
  ;

  LandmarkLists._() : super();
  factory LandmarkLists({
    $core.Iterable<LandmarkList>? landmarks,
  }) {
    final _result = create();
    if (landmarks != null) {
      _result.landmarks.addAll(landmarks);
    }
    return _result;
  }
  factory LandmarkLists.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LandmarkLists.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LandmarkLists clone() => LandmarkLists()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LandmarkLists copyWith(void Function(LandmarkLists) updates) => super.copyWith((message) => updates(message as LandmarkLists)) as LandmarkLists; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static LandmarkLists create() => LandmarkLists._();
  LandmarkLists createEmptyInstance() => create();
  static $pb.PbList<LandmarkLists> createRepeated() => $pb.PbList<LandmarkLists>();
  @$core.pragma('dart2js:noInline')
  static LandmarkLists getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LandmarkLists>(create);
  static LandmarkLists? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LandmarkList> get landmarks => $_getList(0);
}

class NormalizedLandmark extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NormalizedLandmark', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mediapipe'), createEmptyInstance: create)
    ..a<$core.double>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'x', $pb.PbFieldType.OF)
    ..a<$core.double>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'y', $pb.PbFieldType.OF)
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'z', $pb.PbFieldType.OF)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'visibility', $pb.PbFieldType.OF)
    ..a<$core.double>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'presence', $pb.PbFieldType.OF)
    ..hasRequiredFields = false
  ;

  NormalizedLandmark._() : super();
  factory NormalizedLandmark({
    $core.double? x,
    $core.double? y,
    $core.double? z,
    $core.double? visibility,
    $core.double? presence,
  }) {
    final _result = create();
    if (x != null) {
      _result.x = x;
    }
    if (y != null) {
      _result.y = y;
    }
    if (z != null) {
      _result.z = z;
    }
    if (visibility != null) {
      _result.visibility = visibility;
    }
    if (presence != null) {
      _result.presence = presence;
    }
    return _result;
  }
  factory NormalizedLandmark.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NormalizedLandmark.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NormalizedLandmark clone() => NormalizedLandmark()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NormalizedLandmark copyWith(void Function(NormalizedLandmark) updates) => super.copyWith((message) => updates(message as NormalizedLandmark)) as NormalizedLandmark; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NormalizedLandmark create() => NormalizedLandmark._();
  NormalizedLandmark createEmptyInstance() => create();
  static $pb.PbList<NormalizedLandmark> createRepeated() => $pb.PbList<NormalizedLandmark>();
  @$core.pragma('dart2js:noInline')
  static NormalizedLandmark getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NormalizedLandmark>(create);
  static NormalizedLandmark? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get x => $_getN(0);
  @$pb.TagNumber(1)
  set x($core.double v) { $_setFloat(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasX() => $_has(0);
  @$pb.TagNumber(1)
  void clearX() => clearField(1);

  @$pb.TagNumber(2)
  $core.double get y => $_getN(1);
  @$pb.TagNumber(2)
  set y($core.double v) { $_setFloat(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasY() => $_has(1);
  @$pb.TagNumber(2)
  void clearY() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get z => $_getN(2);
  @$pb.TagNumber(3)
  set z($core.double v) { $_setFloat(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasZ() => $_has(2);
  @$pb.TagNumber(3)
  void clearZ() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get visibility => $_getN(3);
  @$pb.TagNumber(4)
  set visibility($core.double v) { $_setFloat(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVisibility() => $_has(3);
  @$pb.TagNumber(4)
  void clearVisibility() => clearField(4);

  @$pb.TagNumber(5)
  $core.double get presence => $_getN(4);
  @$pb.TagNumber(5)
  set presence($core.double v) { $_setFloat(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPresence() => $_has(4);
  @$pb.TagNumber(5)
  void clearPresence() => clearField(5);
}

class NormalizedLandmarkList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NormalizedLandmarkList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mediapipe'), createEmptyInstance: create)
    ..pc<NormalizedLandmark>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'landmark', $pb.PbFieldType.PM, subBuilder: NormalizedLandmark.create)
    ..hasRequiredFields = false
  ;

  NormalizedLandmarkList._() : super();
  factory NormalizedLandmarkList({
    $core.Iterable<NormalizedLandmark>? landmark,
  }) {
    final _result = create();
    if (landmark != null) {
      _result.landmark.addAll(landmark);
    }
    return _result;
  }
  factory NormalizedLandmarkList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NormalizedLandmarkList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NormalizedLandmarkList clone() => NormalizedLandmarkList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NormalizedLandmarkList copyWith(void Function(NormalizedLandmarkList) updates) => super.copyWith((message) => updates(message as NormalizedLandmarkList)) as NormalizedLandmarkList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NormalizedLandmarkList create() => NormalizedLandmarkList._();
  NormalizedLandmarkList createEmptyInstance() => create();
  static $pb.PbList<NormalizedLandmarkList> createRepeated() => $pb.PbList<NormalizedLandmarkList>();
  @$core.pragma('dart2js:noInline')
  static NormalizedLandmarkList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NormalizedLandmarkList>(create);
  static NormalizedLandmarkList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NormalizedLandmark> get landmark => $_getList(0);
}

class NormalizedLandmarkLists extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NormalizedLandmarkLists', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'mediapipe'), createEmptyInstance: create)
    ..pc<NormalizedLandmarkList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'landmarks', $pb.PbFieldType.PM, subBuilder: NormalizedLandmarkList.create)
    ..hasRequiredFields = false
  ;

  NormalizedLandmarkLists._() : super();
  factory NormalizedLandmarkLists({
    $core.Iterable<NormalizedLandmarkList>? landmarks,
  }) {
    final _result = create();
    if (landmarks != null) {
      _result.landmarks.addAll(landmarks);
    }
    return _result;
  }
  factory NormalizedLandmarkLists.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NormalizedLandmarkLists.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NormalizedLandmarkLists clone() => NormalizedLandmarkLists()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NormalizedLandmarkLists copyWith(void Function(NormalizedLandmarkLists) updates) => super.copyWith((message) => updates(message as NormalizedLandmarkLists)) as NormalizedLandmarkLists; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NormalizedLandmarkLists create() => NormalizedLandmarkLists._();
  NormalizedLandmarkLists createEmptyInstance() => create();
  static $pb.PbList<NormalizedLandmarkLists> createRepeated() => $pb.PbList<NormalizedLandmarkLists>();
  @$core.pragma('dart2js:noInline')
  static NormalizedLandmarkLists getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NormalizedLandmarkLists>(create);
  static NormalizedLandmarkLists? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NormalizedLandmarkList> get landmarks => $_getList(0);
}

