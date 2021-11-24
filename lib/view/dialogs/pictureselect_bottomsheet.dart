import 'package:flutter/material.dart';

class PictureSelectBottomSheet {
  static Future<dynamic> show(BuildContext context) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (context) {
          return Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      splashColor: Colors.grey,
                      child: const Icon(
                        Icons.camera_alt_rounded,
                        size: 100,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {},
                      splashColor: Colors.red,
                      child: const Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ));
        });
  }
}
