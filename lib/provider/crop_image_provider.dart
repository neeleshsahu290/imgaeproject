import 'dart:typed_data';

import 'package:edlerd_project/constants/constant.dart';
import 'package:edlerd_project/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CropImageProvider extends ChangeNotifier {
  Uint8List? imageData;
  String? imgUrl;

  var loadingImage = false;
  // ignore: unused_field
  String statusText = '';
  var isCropping = false;
    var isCroped = false;

  Uint8List? croppedData;

  Future<void> loadAllImages(String imgUrl) async {
    imageData = (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
        .buffer
        .asUint8List();

    loadingImage = false;
    notifyListeners();
  }

  Future<void> galleryImages({required bool isCamera}) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    imageData = await image!.readAsBytes(); // Converts the file to UInt8List

    // imageData = (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
    //     .buffer
    //     .asUint8List();

    loadingImage = false;
    notifyListeners();
  }
  // Future<Uint8List> _load(String assetName) async {
  //   // final assetData = await rootBundle.load(assetName);
  //   // return assetData.buffer.asUint8List();

  //   return
  // }

  final Repository _repository = Repository();

  uploadImageData({required var file}) async {

    final response = await _repository.uploadPic(fileList: file);
    if (response['status'] == success) {
       imgUrl = (response['data']);
        isCroped = true;

      return true;
    } else {
      return false;
      // _imageData = AsyncValue.error(response['error'], StackTrace.current);
    }

  }
}
