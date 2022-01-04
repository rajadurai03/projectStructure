
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '/utils/constant_utils.dart';
import '/utils/pref_manager.dart';

class ApiRequest {
  final String url;
   Map<String, dynamic> params;
  var formdataParams;

  ApiRequest({
    required this.url,
     required this.params,
    this.formdataParams
  });

  Dio _dio() {
    // Put your authorization token here
    return Dio(BaseOptions(headers: {
    "Accept": "application/json",
    "Authorization": "${PreferenceUtils.getString(prefApiToken)}"},
      responseType: ResponseType.json,
      connectTimeout: 30000,
      receiveTimeout: 30000,));
  }

  Future<void> get({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) async {

    print('GET METHOD DATA  URLS :- $url \n PARAMS :- $params');
    _dio().get(this.url, queryParameters: params).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      if (onError != null) onError(_handleError(error));
    });
  }

  void post({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {  print(' POST METHOD  DATA  URLS :- $url \n PARAMS :- $params');
    _dio().post(this.url, queryParameters: this.params).then((res) {
      if (onSuccess != null) onSuccess(res);
    }).catchError((error) {
      print('ERROR VALUE $error');
      if (onError != null) onError(_handleError(error));
    });
  }

  void postWithfile({
    Function()? beforeSend,
    Function(dynamic data)? onSuccess,
    Function(dynamic error)? onError,
  }) {  print(' POST METHOD WITH FILE  DATA  URLS :- $url \n PARAMS :- $formdataParams');

  _dio().post(this.url, data: this.formdataParams).then((res) {
    if (onSuccess != null) onSuccess(res);
  }).catchError((error) {
    print('ERROR VALUE $error');
    if (onError != null) onError(_handleError(error));
  });
  }



}


String _handleError(DioError error) {
  String? errorDescription = "";

  switch (error.type) {
    case DioErrorType.cancel:
      errorDescription = "Request to API server was cancelled";
      break;
    case DioErrorType.connectTimeout:
      errorDescription = "Connection timeout with API server";
      break;
    case DioErrorType.other:
      errorDescription =
      "Connection to API server failed due to internet connection";
      break;
    case DioErrorType.receiveTimeout:
      errorDescription = "Receive timeout in connection with API server";
      break;
    case DioErrorType.response:
      errorDescription =
      "Error : ${error.response!.statusCode} - ${error.response!.statusMessage}";
      break;
    case DioErrorType.sendTimeout:
      errorDescription = "Send timeout in connection with API server";
      break;
  }
      return errorDescription;

}
