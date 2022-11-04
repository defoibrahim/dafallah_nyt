// ignore_for_file: avoid_dynamic_calls

import 'package:dafallah_nyt/core/error/exceptions.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

dio.Response<dynamic> responseHandler(
  dio.Response<dynamic> response,
) {
  
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
      return response;
    case 401:
      throw ServerException(message: 'Autherization problem, Please login agian'.tr);
    case 403:
      throw ServerException(
        message: 'Error occurred please check internet and retry.'.tr,
      );
    case 404:
      throw ServerException(message: 'Url not found'.tr);
    case 500:
      throw ServerException(message: "Server Error please retry later".tr);
    default:
      throw ServerException(message: 'Something Went wrong, try again'.tr);
  }
}
