import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class CropImageProvider extends ChangeNotifier {
  Uint8List? imageData;

  var loadingImage = false;
  // ignore: unused_field
  String statusText = '';
  var isCropping = false;
  Uint8List? croppedData;

  Future<void> loadAllImages(String imgUrl) async {
    imageData = (await NetworkAssetBundle(Uri.parse(imgUrl)).load(imgUrl))
        .buffer
        .asUint8List();

    loadingImage = false;
    notifyListeners();
  }

  Future<void> galleryImages( {required bool isCamera}) async {
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
}
