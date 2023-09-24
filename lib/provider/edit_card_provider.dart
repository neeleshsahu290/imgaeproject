import 'package:edlerd_project/constants/constant.dart';
import 'package:edlerd_project/repository/base_repository.dart';
import 'package:edlerd_project/screens/upload_picture/model/edit_card_image_data/edit_card_image_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditCardProvider extends ChangeNotifier {
  String? imgUrl;
  AsyncValue<EditCardImageData> _imageData = const AsyncValue.loading();
  AsyncValue<EditCardImageData> get imageData => _imageData;

  final Repository _repository = Repository();

  getImageData({isRefreshing = false}) async {
    if (isRefreshing) {
      _imageData = const AsyncValue.loading();
      notifyListeners();
    }
    final response = await _repository.getImageData();
    if (response['status'] == success) {
      _imageData = AsyncValue.data(response['data']);
      imgUrl = response['data']
              .result![0]
              .customImageCardDesignInfo
              ?.profileBannerImageUrl ??
          "";
    } else {
      _imageData = AsyncValue.error(response['error'], StackTrace.current);
    }
    notifyListeners();
  }

  setImgUrl(String url) {
    imgUrl = url;
    notifyListeners();
  }
}
