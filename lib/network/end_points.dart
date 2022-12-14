import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:petology/network/local/cache_helper.dart';

class EndPoints {
  static const String fbLogin = 'social_auth/facebook/';
  static const String google = 'social_auth/google/';
  static const String signup = 'accounts/auth/SignUp/';
  static const String login = '/accounts/auth/login/';
  static const String pets = '/event/animal/';
  static const String refresh = 'accounts/api/token/refresh/';
  static const String userInfo = '/event/profile/';
  static const String filters = '/event/animal/filters/';

}
String token='';
String refreshToken='';

void signOut(context) => CacheHelper.removeData(key: 'token').then((value) {
  if (value) {
    CacheHelper.removeData(key: 'refresh_token');
    if (kDebugMode) {
      print(value);
    }
    Navigator.pushReplacementNamed(context, '/login');
  }
});