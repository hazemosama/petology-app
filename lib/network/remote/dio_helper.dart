import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://new-idea.herokuapp.com/',
          receiveDataWhenStatusError: true,
          validateStatus: (status) {
            print('status code = ${status}');
            return true;
          }),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
    };

    return await dio!.get(
      url,
    );

    print(dio!.interceptors.runtimeType.toString());
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
    };
    return await dio!.post(
      url,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Authorization': 'Bearer $token',
    };

    return await dio!.put(
      url,
      data: data,
    );
  }
}
