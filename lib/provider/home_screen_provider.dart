// ignore_for_file: use_build_context_synchronously

import 'package:edlerd_project/constants/app_color.dart';
import 'package:edlerd_project/helper/navigator_help.dart';
import 'package:edlerd_project/screens/upload_picture/ui/upload_picture.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreenProvider extends ChangeNotifier {
  CroppedFile? _image;
  late BuildContext ctx;
  //final Repository _repository = Repository();

  init(BuildContext context) {
    ctx = context;
  }

  selectImage({bool isCamera = false}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    if (image != null) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        //   compressQuality: ImageCompressFormat,

        sourcePath: image.path,
        maxHeight: 400, maxWidth: 400,
        aspectRatioPresets: [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Edit Photo',
              toolbarColor: white,
              toolbarWidgetColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.original,
              showCropGrid: true,
              lockAspectRatio: false),
        ],
      );
      _image = croppedFile;
      if (croppedFile != null) {
        navigatorPush(
            ctx,
            UploadPicure(
              file: _image!,
            ));
      }
    }
  }
}
