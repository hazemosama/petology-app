import 'package:dio/dio.dart';
import 'package:petology/network/end_points.dart';
import 'package:petology/utils/app_constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://new-idea.herokuapp.com/',
          receiveDataWhenStatusError: true,
          validateStatus: (status) {
            if (status == 401 && token != '') {
              AppConstants.refreshToken(refreshToken);
            }
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
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    bool isAuth = false,
    String? token,
  }) async {
    if (isAuth) {
      token = 'Bearer $token';
    }
    dio!.options.headers = {
      'Authorization': '$token',
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
