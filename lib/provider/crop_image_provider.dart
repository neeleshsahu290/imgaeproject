
import 'package:crop_your_image/crop_your_image.dart';
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

  changeState(CropStatus status) {
    notifyListeners();
  }

  Future<void> galleryImages({required bool isCamera}) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    imageData = await image!.readAsBytes(); // Converts the file to UInt8List

    loadingImage = false;
    notifyListeners();
  }

  final Repository _repository = Repository();

  uploadImageData({required var file}) async {
    final response = await _repository.uploadPic(fileList: file);
    if (response['status'] == success) {
      imgUrl = (response['data']);
      isCroped = true;
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }
}
