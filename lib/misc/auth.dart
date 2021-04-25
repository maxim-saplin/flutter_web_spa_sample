import 'package:flutter_web_spa_sample/app_settings.dart';
import 'package:flutter_web_spa_sample/grpc/auth.pbgrpc.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import '../../grpc/client_native.dart'
    if (dart.library.io) '../../grpc/client_native.dart'
    if (dart.library.html) '../../grpc/client_web.dart';
import 'preferences_singleton.dart';

class Roles {
  static const String RM = 'RM';
  static const String Employee = 'Employee';
  static const String SalesManager = 'SalesManager';
}

/// !!! Any access to isAuthenticated property when it is false will
/// automatically navigate the app to login screen
class Auth extends ChangeNotifier {
  Auth(this.settings, this.navigatorKey);

  final AppSettings settings;
  final GlobalKey<NavigatorState> navigatorKey;

  /// !!! Any access to isAuthenticated property when it is false will
  /// automatically navigate the app to login screen
  bool get isAuthenticated {
    var a = PreferencesSingleton.instance.getBool('attnt') ?? false;
    if (!a &&
        navigatorKey.currentContext != null &&
        navigatorKey.currentState != null) {
      if (ModalRoute.of(navigatorKey.currentContext!) != null &&
          ModalRoute.of(navigatorKey.currentContext!)?.settings.name !=
              '/login') navigatorKey.currentState?.pushNamed('/login');
    }

    if (a && isExpired) {
      _isAuthenticated = false;
      _jwt = '';
      _message = 'User session expired';
      navigatorKey.currentState?.pushNamed('/login');
    } else if (!a &&
        ModalRoute.of(navigatorKey.currentContext!) != null &&
        ModalRoute.of(navigatorKey.currentContext!)?.settings.name !=
            '/login') {
      _isAuthenticated = false;
      _message = '';
      navigatorKey.currentState?.pushNamed('/login');
    }

    return a;
  }

  set _isAuthenticated(bool value) =>
      PreferencesSingleton.instance.setBool('attnt', value);

  bool get isExpired => jwt.isNotEmpty ? JwtDecoder.isExpired(jwt) : true;

  String _userName = '';
  String get userName => _userName;

  String _role = '';
  String get role => _role;

  //TODO - Store in secure storage on native clients
  //String _jwt = '';
  String get jwt => PreferencesSingleton.instance.getString('ttnt') ?? '';
  set _jwt(String value) =>
      PreferencesSingleton.instance.setString('ttnt', value);

  String _error = '';
  String get error => _error;

  String _message = '';
  String get message => _message;

  void login(String userName, String password) async {
    try {
      var channel = getGrpcClientChannel(
          settings.host, settings.port, settings.grpcUseHttps);

      var client = AuthServiceClient(channel);

      var result = await client
          .login(LoginRequest(userName: userName, password: password));

      if (result.jwtToken.isEmpty) {
        _error = 'Invalid login or password';
        _isAuthenticated = false;
      } else {
        try {
          _jwt = result.jwtToken;
          if (isExpired) throw 'Expired token';
          var c = JwtDecoder.decode(jwt);
          _userName = c['name'];
          _role = c['role'];
          _error = '';
          _isAuthenticated = true;

          navigatorKey.currentState?.pushNamed('/');
        } catch (e) {
          _error = 'Can\'t decode authentication response';
          _isAuthenticated = false;
          _jwt = '';
        }
      }
    } catch (e) {
      _error = 'An error occured\n' + e.toString();
    }

    notifyListeners();
  }

  void logout() {
    _message = 'You have loged out';
    _error = '';
    _isAuthenticated = false;
    _jwt = '';
    navigatorKey.currentState?.pushNamed('/login');
    notifyListeners();
  }
}

class Tuple<T1, T2> {
  Tuple(this.value_1, this.value_2);

  final T1 value_1;
  final T2 value_2;
}

/// The class is a middle-man between users of GrpcClient objects and Auth class
/// which handles user authentication and authorization via Auth provider
class GrpcAuthManager {
  GrpcAuthManager(this.settings, this.auth)
      : _channel = getGrpcClientChannel(
            settings.host, settings.port, settings.grpcUseHttps);

  final AppSettings settings;
  final Auth auth;
  final ClientChannelBase _channel;

  Map<Type, Tuple<Client, String>> _instances = {};

  /// Use this wrapper-method to create gRPC client with propper authentication.
  /// Returns instance of gRPC Client with properly set-up JWT token in Metadata.
  /// If JWT token is different from the last time the channel of type T was
  /// requested, a new channel is created, otherwise previously created instance is returned.
  /// If there's no active authentication (non was done or it expired) the method throws an Exception
  /// and asks authentication provider to redirect to Login page
  T getAuthenticatedClient<T extends Client>(
      T Function(ClientChannelBase channel, CallOptions options) creator) {
    if (!auth.isAuthenticated) throw 'No authenticated user session';
    var instance = _instances[T];

    if (instance == null || instance.value_2 != auth.jwt) {
      var c = creator(
          _channel,
          CallOptions(metadata: {
            'Authorization': 'Bearer ' + auth.jwt
            //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6IlRlc3QiLCJuYmYiOjE2MTgxNDYyMTYsImV4cCI6MTcwNDA1NjQwMCwiaWF0IjoxNjE4MTQ2MjE2fQ.S61KJ7NnTgCnJZT-uB9Slk9kNKi7JOchnqRYY9jXMgg'
          }));
      _instances[T] = Tuple(c, auth.jwt);
      return c;
    } else
      return instance.value_1 as T;
  }
}

class FakeAuth extends Auth {
  FakeAuth(AppSettings settings, GlobalKey<NavigatorState> navigatorKey)
      : super(settings, navigatorKey);

  bool _isAuthenticated = true;

  bool get isAuthenticated => _isAuthenticated;

  void login(String userName, String password) async {
    _userName = 'cnemo';
    _role = 'RM';
    _error = '';
    _isAuthenticated = true;

    navigatorKey.currentState?.pushNamed('/');

    notifyListeners();
  }

  void logout() {
    _message = 'You have loged out';
    _error = '';
    _isAuthenticated = false;
    navigatorKey.currentState?.pushNamed('/login');
    notifyListeners();
  }
}
