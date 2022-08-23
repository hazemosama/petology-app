import 'package:flutter/material.dart';
import 'package:petology/models/pets_model.dart' show Animals;
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class PetDetailsScreen extends StatelessWidget {
  const PetDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = '/pet-details';

  @override
  Widget build(BuildContext context) {
    final pet = ModalRoute.of(context)!.settings.arguments as Animals;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 335.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        pet.image[0].imUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: AppColors.darkBrown,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(20.0),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(10, 40),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 17,
                    child: IconButton(
                      iconSize: 22,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Image.asset(ImageAssets.back2),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        pet.name,
                        style: const TextStyle(
                          fontSize: 24.0,
                          color: AppColors.darkBrown,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Shared by: ',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: AppColors.darkBrown,
                            ),
                          ),
                          Text(
                            '${pet.user.firstName} ${pet.user.lastName}',
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: AppColors.darkBrown,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 35,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.whatsapp),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                          SizedBox(
                            width: 35,
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.phone),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        pet.date,
                        style: const TextStyle(
                          color: AppColors.darkBrown,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        pet.location,
                        style: const TextStyle(
                          color: AppColors.darkBrown,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Divider(
                        color: AppColors.darkBrown,
                        thickness: 1.0,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'About',
                            style: TextStyle(
                              color: AppColors.darkBrown,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'House Trained: ${pet.houseTranied }',
                        style: const TextStyle(
                          color: AppColors.darkBrown,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Color: ${pet.color}',
                        style: const TextStyle(
                          color: AppColors.darkBrown,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Size: ${pet.size}',
                        style: const TextStyle(
                          color: AppColors.darkBrown,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        'Hair Length: ${pet.hairLength}',
                        style: const TextStyle(
                          color: AppColors.darkBrown,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
