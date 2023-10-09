// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:edlerd_project/api/api_constant.dart';
import 'package:edlerd_project/api/http_api_client.dart';
import 'package:edlerd_project/util/utils.dart';
import 'package:http_parser/http_parser.dart';

import '../constants/constant.dart';

class ImageRepository {
  final headers = {
    "Content-Type": "application/json",
    'Authorization': 'Bearer $token',
  };
  Future<Map<String, dynamic>> getImageData() async {
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.getImageData, {"cardImageId": "6300ba8b5c4ce60057ef9b0c"},
          header: headers, acceptedErrorResponse: [400, 401]);

      if (response is Response) {
        //  log(response.data.toString());
        if (isSuccess(response.statusCode!)) {
          if (response.data != null) {
            List resultList = response.data["result"] != null
                ? (response.data["result"] as List<dynamic>)
                : [];

            if (resultList.isNotEmpty &&
                resultList.first["customImageCardDesignInfo"] != null &&
                resultList.first["customImageCardDesignInfo"]
                        ["profileBannerImageURL"] !=
                    null) {
              return {
                'status': success,
                'data': resultList.first["customImageCardDesignInfo"]
                    ["profileBannerImageURL"]
              };
            }
            return {'status': error, 'error': failureMessage};
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

    var response = await HttpApiClient.getInstance().post(
        ApiConstant.uploadImageData, formData,
        header: headers, acceptedErrorResponse: [400, 401]);
    try {
      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          if (response.data != null &&
              response.data["success"] == true &&
              response.data["isAuth"] == true) {
            List resultList = response.data["result"] != null
                ? (response.data["result"] as List<dynamic>)
                : [];

            if (resultList.isNotEmpty &&
                resultList.first["profileBannerImageURL"] != null) {
              return {
                'status': success,
                'data': resultList.first["profileBannerImageURL"]
              };
            }
            return {'status': error, 'error': failureMessage};
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
      return {'status': error, 'error': e.toString()};
    }
  }
}
