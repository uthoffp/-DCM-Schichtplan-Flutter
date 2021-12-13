import 'package:dcm_flutter/viewmodel/abrequest_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

//shows the bottom sheet where the user can select where the attachments should be chosen from (gallery or camera)
class PictureSelectBottomSheet extends StatefulWidget {
  final AbRequestViewModel _viewModel;

  PictureSelectBottomSheet(this._viewModel);

  static Future<dynamic> show(BuildContext context, AbRequestViewModel viewModel) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (context) {
          return PictureSelectBottomSheet(viewModel);
        });
  }

  @override
  State<PictureSelectBottomSheet> createState() => _PictureSelectBottomSheetState();
}

class _PictureSelectBottomSheetState extends State<PictureSelectBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  Future pickImage(ImageSource imageSource) async {
    var image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) {
      return;
    } else {
      widget._viewModel.setImage(image.path);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
        padding: const EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                pickImage(ImageSource.camera);
              },
              splashColor: Colors.grey,
              child: const Icon(
                Icons.camera_alt_rounded,
                size: 100,
                color: Colors.red,
              ),
            ),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: () {
                pickImage(ImageSource.gallery);
              },
              splashColor: Colors.red,
              child: const Icon(
                Icons.image,
                size: 100,
                color: Colors.red,
              ),
            ),
          ],
        ));
  }
}
