import 'package:flutter/material.dart';

class AbRequestCheckBottomSheet {
  static Future<dynamic> show(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [],
              ));
        });
  }
}
