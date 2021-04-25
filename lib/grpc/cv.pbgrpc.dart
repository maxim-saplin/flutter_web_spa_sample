///
//  Generated code. Do not modify.
//  source: cv.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'cv.pb.dart' as $0;
export 'cv.pb.dart';

class CvServiceClient extends $grpc.Client {
  static final _$getCvs = $grpc.ClientMethod<$0.CvRequest, $0.CvResponse>(
      '/Cv.CvService/GetCvs',
      ($0.CvRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CvResponse.fromBuffer(value));
  static final _$getColumnDistinctValues = $grpc.ClientMethod<
          $0.ColumnDistinctValuesRequest, $0.ColumnDistinctValuesResponse>(
      '/Cv.CvService/GetColumnDistinctValues',
      ($0.ColumnDistinctValuesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ColumnDistinctValuesResponse.fromBuffer(value));

  CvServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.CvResponse> getCvs($0.CvRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCvs, request, options: options);
  }

  $grpc.ResponseFuture<$0.ColumnDistinctValuesResponse> getColumnDistinctValues(
      $0.ColumnDistinctValuesRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getColumnDistinctValues, request,
        options: options);
  }
}

abstract class CvServiceBase extends $grpc.Service {
  $core.String get $name => 'Cv.CvService';

  CvServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CvRequest, $0.CvResponse>(
        'GetCvs',
        getCvs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CvRequest.fromBuffer(value),
        ($0.CvResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ColumnDistinctValuesRequest,
            $0.ColumnDistinctValuesResponse>(
        'GetColumnDistinctValues',
        getColumnDistinctValues_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ColumnDistinctValuesRequest.fromBuffer(value),
        ($0.ColumnDistinctValuesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.CvResponse> getCvs_Pre(
      $grpc.ServiceCall call, $async.Future<$0.CvRequest> request) async {
    return getCvs(call, await request);
  }

  $async.Future<$0.ColumnDistinctValuesResponse> getColumnDistinctValues_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ColumnDistinctValuesRequest> request) async {
    return getColumnDistinctValues(call, await request);
  }

  $async.Future<$0.CvResponse> getCvs(
      $grpc.ServiceCall call, $0.CvRequest request);
  $async.Future<$0.ColumnDistinctValuesResponse> getColumnDistinctValues(
      $grpc.ServiceCall call, $0.ColumnDistinctValuesRequest request);
}
