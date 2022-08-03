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
                  height: 250,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                      scrollDirection:Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                            width: 170,
                            height: 250,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkBrown,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  ImageAssets.aboutDog,
                                  width: 100,
                                  height: 100,
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
                                  child: const Text(
                                    'Read More',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.darkBrown,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(width: 8,),
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
