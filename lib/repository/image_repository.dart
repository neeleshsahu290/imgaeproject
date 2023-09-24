// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edlerd_project/api/api_constant.dart';
import 'package:edlerd_project/api/http_api_client.dart';
import 'package:edlerd_project/screens/upload_picture/model/edit_card_image_data/edit_card_image_data.dart';
import 'package:edlerd_project/util/utils.dart';
import 'package:http_parser/http_parser.dart';

import '../constants/constant.dart';

class ImageRepository {
  Future<Map<String, dynamic>> getImageData() async {
    try {
      final response =
          await HttpApiClient.getInstance().post(ApiConstant.getImageData, {
        "cardImageId": "6300ba8b5c4ce60057ef9b0c"
      }, header: {
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      }, acceptedErrorResponse: [
        400,
        401
      ]);

      if (response is Response) {
        log(response.data.toString());
        if (isSuccess(response.statusCode!)) {
          if (response.data != null) {
            return {
              'status': success,
              'data': EditCardImageData.fromJson(response.data)
            };
          } else {
            return {
              'status': error,
              'error': noDataText,
            };
          }
        } else {
          return {
            'status': error,
            'error': "Failed to load Test",
          };
        }
      } else {
        return {
          'status': failure,
          'error': response["message"] ?? failureMessage
        };
      }
    } catch (e) {
      return {'status': error, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> uploadPic({required var fileList}) async {
    String fileName = fileList.path.split('/').last;

    MultipartFile file = await MultipartFile.fromFile(fileList.path,
        filename: fileName, contentType: MediaType("image", "jpg"));

    var formData = FormData.fromMap({"profileBannerImageURL": file});

    var response = await HttpApiClient.getInstance()
        .post(ApiConstant.uploadImageData, formData, header: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
    }, acceptedErrorResponse: [
      400,
      401
    ]);
    try {
      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          if (response.data != null) {
            return {
              'status': success,
              'data': response.data['result'][0]['profileBannerImageURL']
            };
          } else {
            return {'status': error, 'error': failureMessage};
          }
        } else {
          return {'status': error, 'error': failureMessage};
        }
      } else {
        return {
          'status': failure,
          'error': response["message"] ?? failureMessage
        };
      }
    } catch (e) {
      return {'status': error, 'error': failureMessage};
    }
  }
}
