import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';

class DefaultFormField extends StatelessWidget {
  double? width;
   String? hint;
  bool? isPassword;
  TextEditingController? controller;
  TextInputType keyboardType;
  ValueChanged<String>? onSubmit;
  ValueChanged<String>? onChange;
  VoidCallback? onTap;
  FormFieldValidator<String>? validate;
  String? label;
  IconData? prefix;
  IconData? suffix;
  VoidCallback? suffixPressed;
  bool isClickable = true;
  Color? color;

   DefaultFormField({
    super.key,
    this.controller,
    this.width,
    this.hint,
    required this.keyboardType,
    this.onSubmit,
    this.onChange,
    this.onTap,
    this.validate,
    this.label,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    bool isClickable = true,
    this.isPassword,
  this.color

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
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword??false,
          enabled: isClickable,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onTap: onTap,
          validator: validate,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(50.0),
            ),
            labelText: label,
            suffixIcon: suffix != null
                ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffix,
                color: color,
              ),
            )
                : null,
            hintText: hint ?? 'hint',
            hintStyle: const TextStyle(
              color: AppColors.medBrown,
            ),
          ),),
      ),
    );
  }
}
