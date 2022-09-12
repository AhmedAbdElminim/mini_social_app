import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://woilo.devmee.tech/api/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
      String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };
    return dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> getData({required String url, String? token}) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    return dio.get(url);
  }
}
