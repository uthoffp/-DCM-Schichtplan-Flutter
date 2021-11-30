import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message {
  static void show(BuildContext context, String text) {
    var snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(text),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
