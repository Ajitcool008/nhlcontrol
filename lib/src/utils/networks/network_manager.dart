import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:nhlcontrol/src/utils/helpers/appSnackbar.dart';
import 'package:nhlcontrol/src/utils/networks/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// The NetworkManager class provide an API network requests
class NetworkManager {
  static final NetworkManager _apiService = NetworkManager._internal();

  Dio _dio = Dio();

  bool isContentTypeJson = true;
  bool _isHttpRequest = false;
  bool _urlEncode = false;
  String? baseUrl = EndPoints.baseApi;

  factory NetworkManager() {
    return _apiService;
  }

  NetworkManager._internal();

  Dio getDio({isJsonType = true, isHttpRequest = false, isUrlEncoded = false}) {
    isContentTypeJson = isJsonType;
    _urlEncode = isUrlEncoded;
    _isHttpRequest = isHttpRequest;
    _init();
    return _dio;
  }

  static NetworkManager get instance => _apiService;

  _init() async {
    _dio = Dio();
    _dio.options.baseUrl = baseUrl!;
    _dio.options.contentType = Headers.jsonContentType;
    _dio.interceptors.add(LogInterceptor());
    _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      compact: false,
    ));
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (isContentTypeJson) options.headers["Content-Type"] = "application/json";

      if (_urlEncode) options.headers["Content-Type"] = "application/x-www-form-urlencoded";

      if (_isHttpRequest) options.headers["X-Requested-With"] = "XMLHttpRequest";
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      return handler.next(response); // continue
    }, onError: (DioError e, handler) {
      if (!kReleaseMode) {
        AppSnackbar.showSnackbar("API ERROR : ${e.requestOptions.path}", e.response.toString(), AlertType.internalInfo,
            position: SnackPosition.BOTTOM, duration: const Duration(seconds: 10));
      }
      return handler.next(e); //continue
    }));

    _dio.options.receiveTimeout = 10000;
  }
}
