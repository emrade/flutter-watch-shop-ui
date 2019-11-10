import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'router.dart' as router;
import 'theme.dart';
import 'utils/utils.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      onGenerateRoute: router.generateRoute,
      initialRoute: router.homeViewRoute,
    );
  }
}