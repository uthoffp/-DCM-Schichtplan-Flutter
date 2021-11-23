import 'package:dcm_flutter/resources/strings.dart';
import 'package:dcm_flutter/resources/themes.dart';
import 'package:dcm_flutter/view/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const DcmApp());
}

class DcmApp extends StatelessWidget {
  const DcmApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      theme: getTheme(),
      home: const LoginPage(),
    );
  }

  static ThemeData getTheme() {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    if (brightness == Brightness.dark) return DcmTheme.dark();
    return DcmTheme.light();
  }
}