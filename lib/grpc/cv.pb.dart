///
//  Generated code. Do not modify.
//  source: cv.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $1;
import 'google/protobuf/wrappers.pb.dart' as $2;

class CvRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CvRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cv'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'itemsPerPage', $pb.PbFieldType.O3)
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'columns')
    ..pc<Filter>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', $pb.PbFieldType.PM, subBuilder: Filter.create)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'orderBy')
    ..aOB(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'isDesc')
    ..hasRequiredFields = false
  ;

  CvRequest._() : super();
  factory CvRequest({
    $core.int? pageNumber,
    $core.int? itemsPerPage,
    $core.Iterable<$core.String>? columns,
    $core.Iterable<Filter>? filters,
    $core.String? orderBy,
    $core.bool? isDesc,
  }) {
    final _result = create();
    if (pageNumber != null) {
      _result.pageNumber = pageNumber;
    }
    if (itemsPerPage != null) {
      _result.itemsPerPage = itemsPerPage;
    }
    if (columns != null) {
      _result.columns.addAll(columns);
    }
    if (filters != null) {
      _result.filters.addAll(filters);
    }
    if (orderBy != null) {
      _result.orderBy = orderBy;
    }
    if (isDesc != null) {
      _result.isDesc = isDesc;
    }
    return _result;
  }
  factory CvRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CvRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CvRequest clone() => CvRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CvRequest copyWith(void Function(CvRequest) updates) => super.copyWith((message) => updates(message as CvRequest)) as CvRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CvRequest create() => CvRequest._();
  CvRequest createEmptyInstance() => create();
  static $pb.PbList<CvRequest> createRepeated() => $pb.PbList<CvRequest>();
  @$core.pragma('dart2js:noInline')
  static CvRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CvRequest>(create);
  static CvRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageNumber($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get itemsPerPage => $_getIZ(1);
  @$pb.TagNumber(2)
  set itemsPerPage($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasItemsPerPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearItemsPerPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get columns => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<Filter> get filters => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get orderBy => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderBy($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrderBy() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderBy() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isDesc => $_getBF(5);
  @$pb.TagNumber(6)
  set isDesc($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIsDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsDesc() => clearField(6);
}

class ColumnDistinctValuesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ColumnDistinctValuesRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cv'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'columnName')
    ..pc<Filter>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'filters', $pb.PbFieldType.PM, subBuilder: Filter.create)
    ..hasRequiredFields = false
  ;

  ColumnDistinctValuesRequest._() : super();
  factory ColumnDistinctValuesRequest({
    $core.String? columnName,
    $core.Iterable<Filter>? filters,
  }) {
    final _result = create();
    if (columnName != null) {
      _result.columnName = columnName;
    }
    if (filters != null) {
      _result.filters.addAll(filters);
    }
    return _result;
  }
  factory ColumnDistinctValuesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ColumnDistinctValuesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ColumnDistinctValuesRequest clone() => ColumnDistinctValuesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ColumnDistinctValuesRequest copyWith(void Function(ColumnDistinctValuesRequest) updates) => super.copyWith((message) => updates(message as ColumnDistinctValuesRequest)) as ColumnDistinctValuesRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ColumnDistinctValuesRequest create() => ColumnDistinctValuesRequest._();
  ColumnDistinctValuesRequest createEmptyInstance() => create();
  static $pb.PbList<ColumnDistinctValuesRequest> createRepeated() => $pb.PbList<ColumnDistinctValuesRequest>();
  @$core.pragma('dart2js:noInline')
  static ColumnDistinctValuesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ColumnDistinctValuesRequest>(create);
  static ColumnDistinctValuesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get columnName => $_getSZ(0);
  @$pb.TagNumber(1)
  set columnName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasColumnName() => $_has(0);
  @$pb.TagNumber(1)
  void clearColumnName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<Filter> get filters => $_getList(1);
}

class CvResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'CvResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cv'), createEmptyInstance: create)
    ..pc<Cv>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'cvs', $pb.PbFieldType.PM, subBuilder: Cv.create)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'totalItems')
    ..hasRequiredFields = false
  ;

  CvResponse._() : super();
  factory CvResponse({
    $core.Iterable<Cv>? cvs,
    $fixnum.Int64? totalItems,
  }) {
    final _result = create();
    if (cvs != null) {
      _result.cvs.addAll(cvs);
    }
    if (totalItems != null) {
      _result.totalItems = totalItems;
    }
    return _result;
  }
  factory CvResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CvResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CvResponse clone() => CvResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CvResponse copyWith(void Function(CvResponse) updates) => super.copyWith((message) => updates(message as CvResponse)) as CvResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static CvResponse create() => CvResponse._();
  CvResponse createEmptyInstance() => create();
  static $pb.PbList<CvResponse> createRepeated() => $pb.PbList<CvResponse>();
  @$core.pragma('dart2js:noInline')
  static CvResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CvResponse>(create);
  static CvResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Cv> get cvs => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalItems => $_getI64(1);
  @$pb.TagNumber(2)
  set totalItems($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTotalItems() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalItems() => clearField(2);
}

class ColumnDistinctValuesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ColumnDistinctValuesResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cv'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'values')
    ..hasRequiredFields = false
  ;

  ColumnDistinctValuesResponse._() : super();
  factory ColumnDistinctValuesResponse({
    $core.Iterable<$core.String>? values,
  }) {
    final _result = create();
    if (values != null) {
      _result.values.addAll(values);
    }
    return _result;
  }
  factory ColumnDistinctValuesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ColumnDistinctValuesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ColumnDistinctValuesResponse clone() => ColumnDistinctValuesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ColumnDistinctValuesResponse copyWith(void Function(ColumnDistinctValuesResponse) updates) => super.copyWith((message) => updates(message as ColumnDistinctValuesResponse)) as ColumnDistinctValuesResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ColumnDistinctValuesResponse create() => ColumnDistinctValuesResponse._();
  ColumnDistinctValuesResponse createEmptyInstance() => create();
  static $pb.PbList<ColumnDistinctValuesResponse> createRepeated() => $pb.PbList<ColumnDistinctValuesResponse>();
  @$core.pragma('dart2js:noInline')
  static ColumnDistinctValuesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ColumnDistinctValuesResponse>(create);
  static ColumnDistinctValuesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get values => $_getList(0);
}

class Cv extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cv', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cv'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'person')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'position')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'adUser')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'department')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'snapshotName')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'visibility')
    ..aOM<$1.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'created', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'lastModification', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sharedTill', subBuilder: $1.Timestamp.create)
    ..aOS(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'travel')
    ..aOS(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'location')
    ..aOB(12, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dismissed')
    ..pPS(13, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'languages')
    ..aOB(14, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'hasCertificates')
    ..aOS(15, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'division')
    ..aOS(16, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'check')
    ..aOS(17, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'gender')
    ..aOS(18, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'maritalStatus')
    ..aOS(19, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'militaryStatus')
    ..aOS(20, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'speciality')
    ..aOS(21, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'degree')
    ..aOS(22, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdBy')
    ..aOS(23, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedBy')
    ..hasRequiredFields = false
  ;

  Cv._() : super();
  factory Cv({
    $core.String? person,
    $core.String? position,
    $core.String? adUser,
    $core.String? department,
    $core.String? snapshotName,
    $core.String? visibility,
    $1.Timestamp? created,
    $1.Timestamp? lastModification,
    $1.Timestamp? sharedTill,
    $core.String? travel,
    $core.String? location,
    $core.bool? dismissed,
    $core.Iterable<$core.String>? languages,
    $core.bool? hasCertificates,
    $core.String? division,
    $core.String? check_16,
    $core.String? gender,
    $core.String? maritalStatus,
    $core.String? militaryStatus,
    $core.String? speciality,
    $core.String? degree,
    $core.String? createdBy,
    $core.String? updatedBy,
  }) {
    final _result = create();
    if (person != null) {
      _result.person = person;
    }
    if (position != null) {
      _result.position = position;
    }
    if (adUser != null) {
      _result.adUser = adUser;
    }
    if (department != null) {
      _result.department = department;
    }
    if (snapshotName != null) {
      _result.snapshotName = snapshotName;
    }
    if (visibility != null) {
      _result.visibility = visibility;
    }
    if (created != null) {
      _result.created = created;
    }
    if (lastModification != null) {
      _result.lastModification = lastModification;
    }
    if (sharedTill != null) {
      _result.sharedTill = sharedTill;
    }
    if (travel != null) {
      _result.travel = travel;
    }
    if (location != null) {
      _result.location = location;
    }
    if (dismissed != null) {
      _result.dismissed = dismissed;
    }
    if (languages != null) {
      _result.languages.addAll(languages);
    }
    if (hasCertificates != null) {
      _result.hasCertificates = hasCertificates;
    }
    if (division != null) {
      _result.division = division;
    }
    if (check_16 != null) {
      _result.check_16 = check_16;
    }
    if (gender != null) {
      _result.gender = gender;
    }
    if (maritalStatus != null) {
      _result.maritalStatus = maritalStatus;
    }
    if (militaryStatus != null) {
      _result.militaryStatus = militaryStatus;
    }
    if (speciality != null) {
      _result.speciality = speciality;
    }
    if (degree != null) {
      _result.degree = degree;
    }
    if (createdBy != null) {
      _result.createdBy = createdBy;
    }
    if (updatedBy != null) {
      _result.updatedBy = updatedBy;
    }
    return _result;
  }
  factory Cv.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Cv.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Cv clone() => Cv()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Cv copyWith(void Function(Cv) updates) => super.copyWith((message) => updates(message as Cv)) as Cv; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Cv create() => Cv._();
  Cv createEmptyInstance() => create();
  static $pb.PbList<Cv> createRepeated() => $pb.PbList<Cv>();
  @$core.pragma('dart2js:noInline')
  static Cv getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Cv>(create);
  static Cv? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get person => $_getSZ(0);
  @$pb.TagNumber(1)
  set person($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPerson() => $_has(0);
  @$pb.TagNumber(1)
  void clearPerson() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get position => $_getSZ(1);
  @$pb.TagNumber(2)
  set position($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPosition() => $_has(1);
  @$pb.TagNumber(2)
  void clearPosition() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get adUser => $_getSZ(2);
  @$pb.TagNumber(3)
  set adUser($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAdUser() => $_has(2);
  @$pb.TagNumber(3)
  void clearAdUser() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get department => $_getSZ(3);
  @$pb.TagNumber(4)
  set department($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDepartment() => $_has(3);
  @$pb.TagNumber(4)
  void clearDepartment() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get snapshotName => $_getSZ(4);
  @$pb.TagNumber(5)
  set snapshotName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSnapshotName() => $_has(4);
  @$pb.TagNumber(5)
  void clearSnapshotName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get visibility => $_getSZ(5);
  @$pb.TagNumber(6)
  set visibility($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasVisibility() => $_has(5);
  @$pb.TagNumber(6)
  void clearVisibility() => clearField(6);

  @$pb.TagNumber(7)
  $1.Timestamp get created => $_getN(6);
  @$pb.TagNumber(7)
  set created($1.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreated() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreated() => clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureCreated() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Timestamp get lastModification => $_getN(7);
  @$pb.TagNumber(8)
  set lastModification($1.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasLastModification() => $_has(7);
  @$pb.TagNumber(8)
  void clearLastModification() => clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureLastModification() => $_ensure(7);

  @$pb.TagNumber(9)
  $1.Timestamp get sharedTill => $_getN(8);
  @$pb.TagNumber(9)
  set sharedTill($1.Timestamp v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasSharedTill() => $_has(8);
  @$pb.TagNumber(9)
  void clearSharedTill() => clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureSharedTill() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get travel => $_getSZ(9);
  @$pb.TagNumber(10)
  set travel($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTravel() => $_has(9);
  @$pb.TagNumber(10)
  void clearTravel() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get location => $_getSZ(10);
  @$pb.TagNumber(11)
  set location($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasLocation() => $_has(10);
  @$pb.TagNumber(11)
  void clearLocation() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get dismissed => $_getBF(11);
  @$pb.TagNumber(12)
  set dismissed($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasDismissed() => $_has(11);
  @$pb.TagNumber(12)
  void clearDismissed() => clearField(12);

  @$pb.TagNumber(13)
  $core.List<$core.String> get languages => $_getList(12);

  @$pb.TagNumber(14)
  $core.bool get hasCertificates => $_getBF(13);
  @$pb.TagNumber(14)
  set hasCertificates($core.bool v) { $_setBool(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasHasCertificates() => $_has(13);
  @$pb.TagNumber(14)
  void clearHasCertificates() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get division => $_getSZ(14);
  @$pb.TagNumber(15)
  set division($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasDivision() => $_has(14);
  @$pb.TagNumber(15)
  void clearDivision() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get check_16 => $_getSZ(15);
  @$pb.TagNumber(16)
  set check_16($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasCheck_16() => $_has(15);
  @$pb.TagNumber(16)
  void clearCheck_16() => clearField(16);

  @$pb.TagNumber(17)
  $core.String get gender => $_getSZ(16);
  @$pb.TagNumber(17)
  set gender($core.String v) { $_setString(16, v); }
  @$pb.TagNumber(17)
  $core.bool hasGender() => $_has(16);
  @$pb.TagNumber(17)
  void clearGender() => clearField(17);

  @$pb.TagNumber(18)
  $core.String get maritalStatus => $_getSZ(17);
  @$pb.TagNumber(18)
  set maritalStatus($core.String v) { $_setString(17, v); }
  @$pb.TagNumber(18)
  $core.bool hasMaritalStatus() => $_has(17);
  @$pb.TagNumber(18)
  void clearMaritalStatus() => clearField(18);

  @$pb.TagNumber(19)
  $core.String get militaryStatus => $_getSZ(18);
  @$pb.TagNumber(19)
  set militaryStatus($core.String v) { $_setString(18, v); }
  @$pb.TagNumber(19)
  $core.bool hasMilitaryStatus() => $_has(18);
  @$pb.TagNumber(19)
  void clearMilitaryStatus() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get speciality => $_getSZ(19);
  @$pb.TagNumber(20)
  set speciality($core.String v) { $_setString(19, v); }
  @$pb.TagNumber(20)
  $core.bool hasSpeciality() => $_has(19);
  @$pb.TagNumber(20)
  void clearSpeciality() => clearField(20);

  @$pb.TagNumber(21)
  $core.String get degree => $_getSZ(20);
  @$pb.TagNumber(21)
  set degree($core.String v) { $_setString(20, v); }
  @$pb.TagNumber(21)
  $core.bool hasDegree() => $_has(20);
  @$pb.TagNumber(21)
  void clearDegree() => clearField(21);

  @$pb.TagNumber(22)
  $core.String get createdBy => $_getSZ(21);
  @$pb.TagNumber(22)
  set createdBy($core.String v) { $_setString(21, v); }
  @$pb.TagNumber(22)
  $core.bool hasCreatedBy() => $_has(21);
  @$pb.TagNumber(22)
  void clearCreatedBy() => clearField(22);

  @$pb.TagNumber(23)
  $core.String get updatedBy => $_getSZ(22);
  @$pb.TagNumber(23)
  set updatedBy($core.String v) { $_setString(22, v); }
  @$pb.TagNumber(23)
  $core.bool hasUpdatedBy() => $_has(22);
  @$pb.TagNumber(23)
  void clearUpdatedBy() => clearField(23);
}

class Filter extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Filter', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Cv'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'column')
    ..pPS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stringValues')
    ..aOM<$1.Timestamp>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateFrom', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dateTo', subBuilder: $1.Timestamp.create)
    ..aOM<$2.BoolValue>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'boolValue', subBuilder: $2.BoolValue.create)
    ..hasRequiredFields = false
  ;

  Filter._() : super();
  factory Filter({
    $core.String? column,
    $core.Iterable<$core.String>? stringValues,
    $1.Timestamp? dateFrom,
    $1.Timestamp? dateTo,
    $2.BoolValue? boolValue,
  }) {
    final _result = create();
    if (column != null) {
      _result.column = column;
    }
    if (stringValues != null) {
      _result.stringValues.addAll(stringValues);
    }
    if (dateFrom != null) {
      _result.dateFrom = dateFrom;
    }
    if (dateTo != null) {
      _result.dateTo = dateTo;
    }
    if (boolValue != null) {
      _result.boolValue = boolValue;
    }
    return _result;
  }
  factory Filter.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Filter.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Filter clone() => Filter()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Filter copyWith(void Function(Filter) updates) => super.copyWith((message) => updates(message as Filter)) as Filter; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Filter create() => Filter._();
  Filter createEmptyInstance() => create();
  static $pb.PbList<Filter> createRepeated() => $pb.PbList<Filter>();
  @$core.pragma('dart2js:noInline')
  static Filter getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Filter>(create);
  static Filter? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get column => $_getSZ(0);
  @$pb.TagNumber(1)
  set column($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasColumn() => $_has(0);
  @$pb.TagNumber(1)
  void clearColumn() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get stringValues => $_getList(1);

  @$pb.TagNumber(3)
  $1.Timestamp get dateFrom => $_getN(2);
  @$pb.TagNumber(3)
  set dateFrom($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDateFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearDateFrom() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureDateFrom() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get dateTo => $_getN(3);
  @$pb.TagNumber(4)
  set dateTo($1.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDateTo() => $_has(3);
  @$pb.TagNumber(4)
  void clearDateTo() => clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureDateTo() => $_ensure(3);

  @$pb.TagNumber(5)
  $2.BoolValue get boolValue => $_getN(4);
  @$pb.TagNumber(5)
  set boolValue($2.BoolValue v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasBoolValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearBoolValue() => clearField(5);
  @$pb.TagNumber(5)
  $2.BoolValue ensureBoolValue() => $_ensure(4);
}

