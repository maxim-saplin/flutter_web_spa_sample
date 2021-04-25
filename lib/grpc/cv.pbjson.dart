///
//  Generated code. Do not modify.
//  source: cv.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use cvRequestDescriptor instead')
const CvRequest$json = const {
  '1': 'CvRequest',
  '2': const [
    const {'1': 'page_number', '3': 1, '4': 1, '5': 5, '10': 'pageNumber'},
    const {'1': 'items_per_page', '3': 2, '4': 1, '5': 5, '10': 'itemsPerPage'},
    const {'1': 'columns', '3': 3, '4': 3, '5': 9, '10': 'columns'},
    const {'1': 'filters', '3': 4, '4': 3, '5': 11, '6': '.Cv.Filter', '10': 'filters'},
    const {'1': 'order_by', '3': 5, '4': 1, '5': 9, '10': 'orderBy'},
    const {'1': 'is_desc', '3': 6, '4': 1, '5': 8, '10': 'isDesc'},
  ],
};

/// Descriptor for `CvRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cvRequestDescriptor = $convert.base64Decode('CglDdlJlcXVlc3QSHwoLcGFnZV9udW1iZXIYASABKAVSCnBhZ2VOdW1iZXISJAoOaXRlbXNfcGVyX3BhZ2UYAiABKAVSDGl0ZW1zUGVyUGFnZRIYCgdjb2x1bW5zGAMgAygJUgdjb2x1bW5zEiQKB2ZpbHRlcnMYBCADKAsyCi5Ddi5GaWx0ZXJSB2ZpbHRlcnMSGQoIb3JkZXJfYnkYBSABKAlSB29yZGVyQnkSFwoHaXNfZGVzYxgGIAEoCFIGaXNEZXNj');
@$core.Deprecated('Use columnDistinctValuesRequestDescriptor instead')
const ColumnDistinctValuesRequest$json = const {
  '1': 'ColumnDistinctValuesRequest',
  '2': const [
    const {'1': 'column_name', '3': 1, '4': 1, '5': 9, '10': 'columnName'},
    const {'1': 'filters', '3': 2, '4': 3, '5': 11, '6': '.Cv.Filter', '10': 'filters'},
  ],
};

/// Descriptor for `ColumnDistinctValuesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List columnDistinctValuesRequestDescriptor = $convert.base64Decode('ChtDb2x1bW5EaXN0aW5jdFZhbHVlc1JlcXVlc3QSHwoLY29sdW1uX25hbWUYASABKAlSCmNvbHVtbk5hbWUSJAoHZmlsdGVycxgCIAMoCzIKLkN2LkZpbHRlclIHZmlsdGVycw==');
@$core.Deprecated('Use cvResponseDescriptor instead')
const CvResponse$json = const {
  '1': 'CvResponse',
  '2': const [
    const {'1': 'cvs', '3': 1, '4': 3, '5': 11, '6': '.Cv.Cv', '10': 'cvs'},
    const {'1': 'total_items', '3': 2, '4': 1, '5': 3, '10': 'totalItems'},
  ],
};

/// Descriptor for `CvResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cvResponseDescriptor = $convert.base64Decode('CgpDdlJlc3BvbnNlEhgKA2N2cxgBIAMoCzIGLkN2LkN2UgNjdnMSHwoLdG90YWxfaXRlbXMYAiABKANSCnRvdGFsSXRlbXM=');
@$core.Deprecated('Use columnDistinctValuesResponseDescriptor instead')
const ColumnDistinctValuesResponse$json = const {
  '1': 'ColumnDistinctValuesResponse',
  '2': const [
    const {'1': 'values', '3': 1, '4': 3, '5': 9, '10': 'values'},
  ],
};

/// Descriptor for `ColumnDistinctValuesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List columnDistinctValuesResponseDescriptor = $convert.base64Decode('ChxDb2x1bW5EaXN0aW5jdFZhbHVlc1Jlc3BvbnNlEhYKBnZhbHVlcxgBIAMoCVIGdmFsdWVz');
@$core.Deprecated('Use cvDescriptor instead')
const Cv$json = const {
  '1': 'Cv',
  '2': const [
    const {'1': 'person', '3': 1, '4': 1, '5': 9, '10': 'person'},
    const {'1': 'position', '3': 2, '4': 1, '5': 9, '10': 'position'},
    const {'1': 'ad_user', '3': 3, '4': 1, '5': 9, '10': 'adUser'},
    const {'1': 'department', '3': 4, '4': 1, '5': 9, '10': 'department'},
    const {'1': 'snapshot_name', '3': 5, '4': 1, '5': 9, '10': 'snapshotName'},
    const {'1': 'visibility', '3': 6, '4': 1, '5': 9, '10': 'visibility'},
    const {'1': 'created', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    const {'1': 'last_modification', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'lastModification'},
    const {'1': 'shared_till', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'sharedTill'},
    const {'1': 'travel', '3': 10, '4': 1, '5': 9, '10': 'travel'},
    const {'1': 'location', '3': 11, '4': 1, '5': 9, '10': 'location'},
    const {'1': 'dismissed', '3': 12, '4': 1, '5': 8, '10': 'dismissed'},
    const {'1': 'languages', '3': 13, '4': 3, '5': 9, '10': 'languages'},
    const {'1': 'has_certificates', '3': 14, '4': 1, '5': 8, '10': 'hasCertificates'},
    const {'1': 'division', '3': 15, '4': 1, '5': 9, '10': 'division'},
    const {'1': 'check', '3': 16, '4': 1, '5': 9, '10': 'check'},
    const {'1': 'gender', '3': 17, '4': 1, '5': 9, '10': 'gender'},
    const {'1': 'marital_status', '3': 18, '4': 1, '5': 9, '10': 'maritalStatus'},
    const {'1': 'military_status', '3': 19, '4': 1, '5': 9, '10': 'militaryStatus'},
    const {'1': 'speciality', '3': 20, '4': 1, '5': 9, '10': 'speciality'},
    const {'1': 'degree', '3': 21, '4': 1, '5': 9, '10': 'degree'},
    const {'1': 'created_by', '3': 22, '4': 1, '5': 9, '10': 'createdBy'},
    const {'1': 'updated_by', '3': 23, '4': 1, '5': 9, '10': 'updatedBy'},
  ],
};

/// Descriptor for `Cv`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cvDescriptor = $convert.base64Decode('CgJDdhIWCgZwZXJzb24YASABKAlSBnBlcnNvbhIaCghwb3NpdGlvbhgCIAEoCVIIcG9zaXRpb24SFwoHYWRfdXNlchgDIAEoCVIGYWRVc2VyEh4KCmRlcGFydG1lbnQYBCABKAlSCmRlcGFydG1lbnQSIwoNc25hcHNob3RfbmFtZRgFIAEoCVIMc25hcHNob3ROYW1lEh4KCnZpc2liaWxpdHkYBiABKAlSCnZpc2liaWxpdHkSNAoHY3JlYXRlZBgHIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2NyZWF0ZWQSRwoRbGFzdF9tb2RpZmljYXRpb24YCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhBsYXN0TW9kaWZpY2F0aW9uEjsKC3NoYXJlZF90aWxsGAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKc2hhcmVkVGlsbBIWCgZ0cmF2ZWwYCiABKAlSBnRyYXZlbBIaCghsb2NhdGlvbhgLIAEoCVIIbG9jYXRpb24SHAoJZGlzbWlzc2VkGAwgASgIUglkaXNtaXNzZWQSHAoJbGFuZ3VhZ2VzGA0gAygJUglsYW5ndWFnZXMSKQoQaGFzX2NlcnRpZmljYXRlcxgOIAEoCFIPaGFzQ2VydGlmaWNhdGVzEhoKCGRpdmlzaW9uGA8gASgJUghkaXZpc2lvbhIUCgVjaGVjaxgQIAEoCVIFY2hlY2sSFgoGZ2VuZGVyGBEgASgJUgZnZW5kZXISJQoObWFyaXRhbF9zdGF0dXMYEiABKAlSDW1hcml0YWxTdGF0dXMSJwoPbWlsaXRhcnlfc3RhdHVzGBMgASgJUg5taWxpdGFyeVN0YXR1cxIeCgpzcGVjaWFsaXR5GBQgASgJUgpzcGVjaWFsaXR5EhYKBmRlZ3JlZRgVIAEoCVIGZGVncmVlEh0KCmNyZWF0ZWRfYnkYFiABKAlSCWNyZWF0ZWRCeRIdCgp1cGRhdGVkX2J5GBcgASgJUgl1cGRhdGVkQnk=');
@$core.Deprecated('Use filterDescriptor instead')
const Filter$json = const {
  '1': 'Filter',
  '2': const [
    const {'1': 'column', '3': 1, '4': 1, '5': 9, '10': 'column'},
    const {'1': 'string_values', '3': 2, '4': 3, '5': 9, '10': 'stringValues'},
    const {'1': 'date_from', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateFrom'},
    const {'1': 'date_to', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'dateTo'},
    const {'1': 'bool_value', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.BoolValue', '10': 'boolValue'},
  ],
};

/// Descriptor for `Filter`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List filterDescriptor = $convert.base64Decode('CgZGaWx0ZXISFgoGY29sdW1uGAEgASgJUgZjb2x1bW4SIwoNc3RyaW5nX3ZhbHVlcxgCIAMoCVIMc3RyaW5nVmFsdWVzEjcKCWRhdGVfZnJvbRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCGRhdGVGcm9tEjMKB2RhdGVfdG8YBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgZkYXRlVG8SOQoKYm9vbF92YWx1ZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5Cb29sVmFsdWVSCWJvb2xWYWx1ZQ==');
