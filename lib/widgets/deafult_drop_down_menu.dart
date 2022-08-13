import 'package:flutter/material.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/themes/colors.dart';

class DropDownContainer extends StatelessWidget {
  DropDownContainer({
    Key? key,
    required this.items,
    this.width,
    this.hint,
    this.controller,
    this.method,
  }) : super(key: key);
  final String? hint;
  final double? width;
  final List<String> items;
  TextEditingController? controller;
  VoidCallback? method;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300,
      child: Material(
        elevation: 5,
        shadowColor: AppColors.lightBrown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: DropdownButtonFormField(
            isExpanded: true,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: const TextStyle(
                color: AppColors.medBrown,
              ),
            ),
            onChanged: (String? value) {
              controller!.text = value!;
              print(value);
              print(controller!.text);
              print('cubit controller is: ${AppCubit.get(context).sizeController.text}');
            },
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
