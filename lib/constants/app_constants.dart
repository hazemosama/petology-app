import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:petology/themes/colors.dart';

enum ToastStates { success, error, warning }

Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case (ToastStates.success):
      color = Colors.green;
      break;
    case (ToastStates.error):
      color = Colors.red;
      break;
    case (ToastStates.warning):
      color = Colors.amber;
      break;
  }
  return color;
}

class AppConstants {
  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? gravity,
    ToastStates? type,
  }) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      backgroundColor:
          type != null ? chooseToastColor(type) : color ?? AppColors.medBrown,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }
}
