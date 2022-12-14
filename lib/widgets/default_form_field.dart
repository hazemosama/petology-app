import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';

class DefaultFormField extends StatelessWidget {
  final double? width;
  final double? height;
  final String? hint;
  final bool? isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final ValueChanged<String>? onSubmit;
  final ValueChanged<String>? onChange;
  final VoidCallback? onTap;
  final FormFieldValidator<String>? validate;
  final String? label;
  final IconData? prefix;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final bool isClickable = true;
  final Color? color;
  final String? text;
  final int? maxLines;

  const DefaultFormField({
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
    this.color,
    this.text,
    this.height,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300.0,
      height: height,
      child: Material(
        elevation: 5,
        shadowColor: AppColors.lightBrown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isPassword ?? false,
          enabled: isClickable,
          onFieldSubmitted: onSubmit,
          onChanged: onChange,
          onTap: onTap,
          validator: validate,
          maxLines: maxLines ?? 1,
          decoration: InputDecoration(
            prefixText: text,
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
          ),
        ),
      ),
    );
  }
}
