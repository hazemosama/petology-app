import 'package:flutter/material.dart';
import 'package:petology/models/pets_model.dart' show PetModel;
import 'package:petology/screens/pet_details_screen.dart';
import 'package:petology/themes/colors.dart';

class PetHome extends StatelessWidget {
  const PetHome({
    Key? key,
    required this.petName,
    required this.petImage,
    required this.petModel,
    required this.index,

  }) : super(key: key);

  final String petName;
  final String petImage;
  final PetModel petModel;
  final int index;

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
            onPressed: () {
              Navigator.pushNamed(
                context,
                PetDetailsScreen.routeName,
                arguments: petModel.data.animals[index],
              );
            },
            minWidth: 140,
            height: 40,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
              side: const BorderSide(
                color: AppColors.lightBrown,
                width: 2,
              ),
            ),
            child: const Text(
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
