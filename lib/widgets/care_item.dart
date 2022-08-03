import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class CareItem extends StatelessWidget {
  List<String> careIcons = [
    ImageAssets.food,
    ImageAssets.transportation,
    ImageAssets.toys,
    ImageAssets.inoculation,
    ImageAssets.sleeping,
    ImageAssets.vitamins,
    ImageAssets.bowls,
  ];

  List<String> careHeads = [
    'Pet food',
    'Tranpostaion',
    'Toys',
    'Inoculation',
    'Sleeping Area',
    'Vitamins',
    'Bowls and Cups',
  ];

  int index;

  CareItem({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              const CircleAvatar(
                backgroundColor: AppColors.darkBrown,
                radius: 45,
              ),
              Transform.translate(
                offset: Offset(0,-10),
                child: Image.asset(
                  careIcons[index],
                  height: 65,
                  width: 65,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30.0,
          ),
          Text(
            careHeads[index],
            style: const TextStyle(
              fontSize: 23.0,
              fontWeight: FontWeight.w500
            ),
          )
        ],
      ),
    );
  }
}
