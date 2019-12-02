/// [Dart Packages]
import 'dart:async';

/// [Flutter Packages]
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// [Tyba Packages]
import 'package:tyba_front_test/src/core/util/index.dart';
import 'package:tyba_front_test/src/locator.dart';
import 'package:tyba_front_test/src/ui/index.dart';
import 'package:tyba_front_test/src/ui/shared/index.dart';

void main() async {
  setupLocator();
  bool isInDebugMode = !(const bool.fromEnvironment('dart.vm.product'));
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  runZoned<Future<Null>>(() async {
    var configuredApp = AppSettings(
      appName: 'Tyba',
      projectId: 'ae60251ccbf77ccc1ba924d45b7a553e',
      collectionId: 'jjNviT7M0LSYycHSKDOv',
      releaseMode: !isInDebugMode,
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: cornflower_blue,
          canvasColor: Colors.transparent,
        ),
        initialRoute: initialRoute,
        onGenerateRoute: Router.generateRoute,
      ),
    );
    runApp(configuredApp);
  }, onError: (error, stackTrace) async {
    debugPrint(error.toString());
  });
}
