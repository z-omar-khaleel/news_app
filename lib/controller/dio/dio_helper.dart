import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

//apiKey:d6e5b8cd16b5452b860f67b8aa62b6d6
class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  static Future<Response> getArticles(
      {@required String url, @required Map<String, dynamic> query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
