import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class TextWithBackground extends StatelessWidget {
  final String text;
  final double? fontSize;

  const TextWithBackground({
    Key? key,
    required this.text,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Transform.translate(
          offset: const Offset(15,0),
          child: Image.asset(
            ImageAssets.foot,
            height: 60.0,
            width: 60.0,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColors.darkBrown,
            fontSize: fontSize ?? 30.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
