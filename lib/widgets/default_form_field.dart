import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';

class DefaultFormField extends StatelessWidget {
  final double? width;
  final String? hint;
  final bool? isPassword;
  final TextEditingController? controller;

  const DefaultFormField({
    super.key,
    this.controller,
    this.width,
    this.hint,
    this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300.0,
      child: Material(
        elevation: 5,
        shadowColor: AppColors.lightBrown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50.0),
            ),
            hintText: hint ?? 'hint',
            hintStyle: const TextStyle(
              color: AppColors.medBrown,
            ),
          ),
          obscureText: isPassword == true ? true : false,
        ),
      ),
    );
  }
}
