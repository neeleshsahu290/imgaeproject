import 'package:edlerd_project/constants/constant.dart';
import 'package:edlerd_project/repository/base_repository.dart';
import 'package:flutter/material.dart';

class UploadImageProvider extends ChangeNotifier {
  final Repository _repository = Repository();

  uploadImageData({required var file}) async {
    final response = await _repository.uploadPic(fileList: file);
    if (response['status'] == success) {
      return true;
    } else {
      return false;
    }
  }
}
