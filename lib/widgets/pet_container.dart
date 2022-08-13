import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class PetContainer extends StatelessWidget {
  const PetContainer({
    Key? key,
    required this.petName,
    required this.userName,
    required this.petImageUrl,
    required this.forHome,
  }) : super(key: key);

  final String petName;
  final String userName;
  final String petImageUrl;
  final bool forHome;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: forHome ? 250 : 268,
      decoration: BoxDecoration(
        color: forHome ? Colors.transparent : AppColors.lightGrey,
        border: forHome
            ? Border.all(
                color: AppColors.darkBrown,
                width: 1,
              )
            : const Border.symmetric(),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(petImageUrl),
                fit: BoxFit.cover
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            petName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: AppColors.darkBrown,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            elevation: 2.0,
            color: AppColors.darkBrown,
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
                color: AppColors.lightBrown,
              ),
            ),
          ),
          if (!forHome)
            Column(
              children: [
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'By $userName',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
                const Divider(
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
