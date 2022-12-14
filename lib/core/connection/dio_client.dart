// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'package:dafallah_nyt/core/connection/http_handler.dart';
import 'package:dio/dio.dart';

import '../values/constants.dart';

class DioClient {
   static Dio get DIO_CLIENT {
     final Dio _dio = Dio(
      BaseOptions(
        baseUrl: kServerURL,
        contentType: 'application/json',
      ),
    );
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest:
            (RequestOptions options, RequestInterceptorHandler handler) async {
          options.headers['Content-Type'] = 'application/json';
          options.queryParameters['api-key'] = kApiKey;
          return handler.next(options);
        },
        onResponse:
            (Response<dynamic> e, ResponseInterceptorHandler handler) async {
          try {
            final Response<dynamic> result = responseHandler(e);
            return handler.next(result);
          } catch (e) {
            log('E: $e');
            final DioError error =
                DioError(requestOptions: RequestOptions(path: ''), error: e);
            return handler.reject(error);
          }
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {

        },
      )
    );
    return _dio;
  }
}
