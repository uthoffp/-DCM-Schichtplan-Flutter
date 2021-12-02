import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/resources/themes.dart';
import 'package:dcm_flutter/view/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

// Starting point for the DCM Schichtplan Flutter Application
void main() {
  runApp(const DcmApp());
}

// Root Widget, starts the Login Page and manages app-themes
class DcmApp extends StatelessWidget {
  const DcmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: getTheme(),
      home: const LoginPage(),  //Login Page is the starting page
    );
  }

  // checks the current os theme and sets the app theme accordingly
  static ThemeData getTheme() {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    if (brightness == Brightness.dark) return DcmTheme.dark();
    return DcmTheme.light();
  }
}