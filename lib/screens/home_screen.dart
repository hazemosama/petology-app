import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';
import 'package:petology/widgets/pet_home.dart';

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
                height: 270,
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
                            'There are friends of ours named pets, When you adopt, you support a worthy cause and help diminish the overpopulation of animals. ',
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
                const SizedBox(
                  height: 15.0,
                ),
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
                  child: BlocConsumer<AppCubit, AppStates>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      var petModel = AppCubit.get(context).petModel;
                      return ConditionalBuilder(
                        condition: petModel != null,
                        builder: (context) => ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => PetHome(
                              petName: petModel!.data.animals[index].name,
                              petImage: petModel
                                  .data.animals[index].image[0].imUrl,
                              petModel: petModel,
                              index: index,
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 8,
                                ),
                            itemCount: petModel!.data.animals.length),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
