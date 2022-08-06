import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class PetHome extends StatelessWidget {
  const PetHome({
    Key? key,
    required this.petName,
    required this.petImage,

  }) : super(key: key);

  final String petName;
  final String petImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 250,
      decoration: BoxDecoration(
        color:  Colors.transparent,
        border:  Border.all(
          color: AppColors.darkBrown,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
           petImage,
            width:  100  ,
            height:  100 ,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            petName,
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
            elevation:  0.0 ,
            color: Colors.transparent,
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
                color:  AppColors.darkBrown ,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
