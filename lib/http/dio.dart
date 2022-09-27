import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freelance_demo/utils/app_utils.dart';

class DioHelper {
  Dio dio = Dio();

  DioHelper() {
    dio.options.followRedirects = true;
    dio.options.headers[HttpHeaders.acceptHeader] = "application/json";
    dio.options.validateStatus = (status) => status! <= 400;
    dio.transformer = JsonTransformer();
    //setup auth interceptor
    _setupAuthInterceptor();
    //setup log interceptor
    _setupLogInterceptor();
  }

  void _setupAuthInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          handler.next(options);
        },
        onError: (DioError error,
            ErrorInterceptorHandler errorInterceptorHandler) async {
          if (error.type == DioErrorType.response) {
            switch (error.response!.statusCode) {
              case 401:
                _showToast("403 UnAuthenticated");
                break;
              case 403:
                _showToast("403 Forbidden");
                break;
              case 404:
                _showToast("404 Forbidden");
                break;
              case 429:
                _showToast(
                  "Too many requests - ${error.requestOptions.uri.toString()}",
                );
                break;
              case 500:
                _showToast("500 Server Broken");
                break;
              case 405:
                _showToast("405 Method Not Allowed");
                break;
            }
          } else if (error.type == DioErrorType.other) {
            _showToast("Please check your internet connection");
          } else {
            _showToast(error.message);
          }

          errorInterceptorHandler.resolve(
            Response(
              requestOptions: error.requestOptions,
              data: {"error": error.message},
              statusCode: error.response?.statusCode,
            ),
          );
        },
      ),
    );
  }

  void _showToast(String text) {
    AppUtils.showToast(text);
  }

  void _setupLogInterceptor() {
    dio.interceptors.add(LogInterceptor(responseBody: true));
  }
}

//This transformer runs the json decoding in a background thread.
//Thus returing a Future of Map
class JsonTransformer extends DefaultTransformer {
  JsonTransformer() : super(jsonDecodeCallback: _parseJson);
}

Map<String, dynamic> _parseAndDecode(String response) {
  return jsonDecode(response) as Map<String, dynamic>;
}

Future<Map<String, dynamic>> _parseJson(String text) {
  return compute(_parseAndDecode, text);
}

final Dio dio = DioHelper().dio;
