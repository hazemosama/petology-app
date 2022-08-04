import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';

class DefaultDropDownMenu extends StatelessWidget {

  const DefaultDropDownMenu({
    Key? key,
    required this.items,
    this.width,
    this.hint,

  }) : super(key: key);
  final String? hint;
  final double? width;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 300,
      child: Material(//
        elevation: 5,
        shadowColor: AppColors.lightBrown,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: DropdownButtonFormField(
            decoration:InputDecoration(
                border: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(
                color: AppColors.medBrown,
              ),
            ),
            onChanged: (value) {
              print(value);
            },
            items: items
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 16,
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
