import 'package:edlerd_project/repository/image_repository.dart';

class Repository {
  static final Repository _singleton = Repository._internal();

  factory Repository() => _singleton;

  Repository._internal() {
    // private constructor that creates the singleton instance
  }
  final ImageRepository _imageRepository = ImageRepository();

  // get Image Data
  Future<Map<String, dynamic>> getImageData() =>
      _imageRepository.getImageData();

  // get Image Data
  Future<Map<String, dynamic>> uploadPic({required var fileList}) =>
      _imageRepository.uploadPic(fileList: fileList);
}

var repository = Repository();
