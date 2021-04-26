import 'dart:async';
import 'package:flutter_web_spa_sample/app_settings.dart';
import 'package:flutter_web_spa_sample/model/data/cv_list.dart';
import 'package:flutter_web_spa_sample/model/data/snapshot_list.dart';
import 'package:flutter_web_spa_sample/model/presentation/preferences.dart';
import 'package:flutter_web_spa_sample/model/presentation/table_settings.dart';
import 'package:flutter_web_spa_sample/ui/pages/analytics.dart';
import 'package:flutter_web_spa_sample/ui/pages/cvs.dart';
import 'package:flutter_web_spa_sample/ui/pages/glossary.dart';
import 'package:flutter_web_spa_sample/ui/pages/login.dart';
import 'package:flutter_web_spa_sample/ui/pages/snapshots.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_spa_sample/misc/preferences_singleton.dart';

import 'misc/web_right_click.dart'
    if (dart.library.io) 'misc/web_right_click.dart'
    if (dart.library.html) 'misc/web_right_click_impl.dart';
import 'misc/auth.dart';

void main() async {
  await PreferencesSingleton.init();
  runApp(MyApp());
  disableBrowserRightClicks();
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PageTransition _getTransition(Widget w, RouteSettings s) {
    var t = PageTransition(
        child: w,
        type: PageTransitionType.fade,
        duration: Duration(milliseconds: 400),
        settings: s);
    return t;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Preferences>(
            create: (_) => Preferences(),
          ),
          ChangeNotifierProvider<Auth>(
            //create: (_) => Auth(appSettings(), navigatorKey),
            create: (_) => FakeAuth(appSettings(), navigatorKey),
          ),
          Provider<GrpcAuthManager>(
            create: (context) => GrpcAuthManager(
                appSettings(), Provider.of<Auth>(context, listen: false)),
          ),
          ChangeNotifierProvider<CvListModel>(
            create: (context) => FakeCvListModel(),
            // create: (context) {
            //   return CvListGrpcModel(
            //       Provider.of<GrpcAuthManager>(context, listen: false));
            // },
          ),
          ChangeNotifierProvider<CvListSettings>(
            create: (_) => CvListSettings(),
          ),
          ChangeNotifierProvider<SnapshotListModel>(
            create: (_) => FakeSnapshotListModel(),
          ),
          ChangeNotifierProvider<SnapshotListSettings>(
            create: (_) => SnapshotListSettings(),
          ),
        ],
        child: Consumer<Preferences>(builder: (context, preferences, _) {
          return I18n(
              initialLocale: preferences.locale,
              child: MaterialApp(
                navigatorKey: navigatorKey,
                title: 'CV Databank',
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [
                  const Locale('en', ''),
                  const Locale('ru', ''),
                ],
                builder: (BuildContext context, Widget? child) {
                  if (MediaQuery.of(context).size.width < 700) {
                    return Center(
                        child: ColoredBox(
                            color: Colors.white,
                            child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                    'Screen is to small. Please use device with larger screen (or resize the window)',
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle1))));
                  }
                  if (I18n.of(context).locale.languageCode !=
                      preferences.locale.languageCode) {
                    Timer.run(() {
                      I18n.of(context).locale = preferences.locale;
                    });
                  }
                  return child ?? SizedBox();
                },
                onGenerateRoute: (settings) {
                  var auth = Provider.of<Auth>(context, listen: false);
                  if (!auth.isAuthenticated) {
                    return _getTransition(Login(), settings);
                  }
                  // Routes requireing authorization
                  switch (settings.name) {
                    case '/cvs':
                      return _getTransition(CvList(), settings);
                    case '/snapshots':
                      return _getTransition(Snapshots(), settings);
                    case '/glossary':
                      return _getTransition(Glossary(), settings);
                    case '/analytics':
                      return _getTransition(Analytics(), settings);
                    default:
                      return _getTransition(CvList(), settings);
                  }
                },
                theme: ThemeData(
                    primaryColor: Color.fromARGB(255, 0, 94, 183),
                    accentColor: Color(0xFFe5e5e5),
                    backgroundColor: Colors.grey[200],
                    checkboxTheme: CheckboxThemeData(
                        fillColor: MaterialStateColor.resolveWith(
                            (s) => Color.fromARGB(255, 0, 94, 183))),
                    radioTheme: RadioThemeData(
                        fillColor: MaterialStateColor.resolveWith(
                            (s) => Color.fromARGB(255, 0, 94, 183))),
                    textTheme: TextTheme(subtitle1: TextStyle(fontSize: 14)),
                    outlinedButtonTheme: OutlinedButtonThemeData(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.resolveWith<TextStyle>(
                                (s) => TextStyle(color: Colors.white)),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero)),
                            backgroundColor: MaterialStateProperty.resolveWith<Color>((s) => Color.fromARGB(255, 0, 94, 183))))),
              ));
        }));
  }
}
