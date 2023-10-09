import 'package:edlerd_project/constants/constant.dart';
import 'package:edlerd_project/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditCardProvider extends ChangeNotifier {
  String? imgUrl;
  AsyncValue<String> _imageData = const AsyncValue.loading();
  AsyncValue<String> get imageData => _imageData;

  final Repository _repository = Repository();

  // get Image Url from Server
  getImageData({isRefreshing = false}) async {
    if (isRefreshing) {
      _imageData = const AsyncValue.loading();
      notifyListeners();
    }
    final response = await _repository.getImageData();
    if (response['status'] == success) {
      _imageData = AsyncValue.data(response['data']);
      imgUrl = response['data'];
    } else {
      
      _imageData = AsyncValue.error(response['error'], StackTrace.current);
    }
    notifyListeners();
  }

  // ser Image Url back after cropping
  setImgUrl(String url) {
    imgUrl = url;
    notifyListeners();
  }
}
