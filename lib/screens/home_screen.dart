import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Not only people need a house',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.fade),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Not only people need a house Not only people need a house Not only people need a house Not only people need a house',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                overflow: TextOverflow.fade),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            height: 40,
                            minWidth: 80,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Help them',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 14,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 60.0),
                    child: Image.asset(
                      ImageAssets.aboutDog,
                      height: 200,
                      width: 150,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 140),
                      child: Image.asset(
                        ImageAssets.foot,
                        width: 70,
                        height: 70,
                      ),
                    ),
                    const Text(
                      'Our friends who \n looking for a house',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 270,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const PetContainer(
                            petName: 'caty', forHome: true,
                          ),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 8,
                          ),
                      itemCount: 5),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

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
