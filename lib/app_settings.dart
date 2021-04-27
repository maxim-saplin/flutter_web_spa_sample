import 'package:flutter/foundation.dart';

// Debug settings here
class AppSettings {
  String get host => "localhost";
  int get port => 5000;
  bool get grpcUseHttps => false;
  AppSettings._();
}

// class ReleaseAppSettings implements AppSettings {
//   String get host => "localhost";
//   int get port => 5000;
//   bool get grpcUseHttps => false;
//   ReleaseAppSettings._();
// }

class ReleaseAppSettings implements AppSettings {
  String get host => "test";
  int get port => 443;
  bool get grpcUseHttps => true;
  ReleaseAppSettings._();
}

var _debug = AppSettings._();
var _release = ReleaseAppSettings._();

AppSettings appSettings() => kReleaseMode ? _release : _debug;
