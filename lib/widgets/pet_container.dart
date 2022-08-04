import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class PetContainer extends StatelessWidget {
  const PetContainer({
    Key? key,
    required this.petName,
    required this.forHome,

  }) : super(key: key);

  final String petName;
  final bool forHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: forHome ? 250 : 268,
      decoration: BoxDecoration(
        color: forHome? Colors.transparent : AppColors.lightGrey,
        border: forHome ? Border.all(
          color: AppColors.darkBrown,
          width: 1,
        ) : const Border.symmetric(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageAssets.caty,
            width: forHome ? 100 : 150,
            height: forHome ? 100 : 150,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Caty',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.darkBrown,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            elevation: forHome? 0.0 : 2.0,
            color: forHome ? Colors.transparent : AppColors.darkBrown,
            onPressed: () {},
            minWidth: 140,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: AppColors.lightBrown,
                width: 2,
              ),
            ),
            child: Text(
              'Read More',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: forHome ? AppColors.darkBrown : AppColors.lightBrown,
              ),
            ),
          ),
          if(!forHome)
            Column(
              children: const [
                SizedBox(
                  height: 4.0,
                ),
                Text(
                  'By Hazem',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  color: AppColors.lightBrown,
                  thickness: 4,
                  indent: 55,
                  endIndent: 55,
                )
              ],
            ),
        ],
      ),
    );
  }
}
