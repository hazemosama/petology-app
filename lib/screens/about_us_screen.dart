import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: AppColors.darkBrown,
              height: 250,
              width: double.infinity,
            ),
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Column(
                    children: [
                      Text(
                        'Not only people need a house',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            overflow: TextOverflow.fade),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Image.asset(
                  ImageAssets.aboutDog,
                  height: 250,
                  width: 150,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
