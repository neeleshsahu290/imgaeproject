import 'package:edlerd_project/constants/constant.dart';
import 'package:edlerd_project/repository/base_repository.dart';
import 'package:flutter/material.dart';

class UploadImageProvider extends ChangeNotifier {
  final Repository _repository = Repository();

  uploadImageData({required var file}) async {
    // if (isRefreshing) {
    //   _imageData = const AsyncValue.loading();
    //   notifyListeners();
    // }
    final response = await _repository.uploadPic(fileList: file);
    if (response['status'] == success) {
      return true;
      ////_imageData = AsyncValue.data(response['data']);
    } else {
      return false;
      // _imageData = AsyncValue.error(response['error'], StackTrace.current);
    }
  }
}
