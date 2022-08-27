import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/widgets/deafult_drop_down_menu.dart';
import 'package:petology/widgets/pet_container.dart';

import '../themes/icon_borken.dart';

class AdoptionScreen extends StatelessWidget {
  AdoptionScreen({Key? key}) : super(key: key);
  static const routeName = '/adoption';

  final items = ['choose 1', 'choose 2', 'choose 3'];

  @override
  Widget build(BuildContext context) {
    String category = ModalRoute.of(context)!.settings.arguments as String;
    print('category is ${category}');

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Adoption'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ExpansionTile(
                    leading: const Icon(Icons.filter_list_alt),
                    title: const Text('Filters'),
                    childrenPadding: const EdgeInsets.all(20),
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropDownContainer(
                            items: cubit.filteredList!.choices.breed,
                            width: 150,
                            controller: cubit.breedController,
                            hint: 'Breed',
                          ),
                          DropDownContainer(
                            items: cubit.ageItems,
                            width: 150,
                            controller: cubit.ageController,
                            hint: 'Age',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 13.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropDownContainer(
                            items: cubit.genderItems,
                            width: 150,
                            controller: cubit.genderController,
                            hint: 'Gender',
                          ),
                          DropDownContainer(
                            items: cubit.filteredList!.choices.size,
                            width: 150,
                            controller: cubit.sizeController,
                            hint: 'Size',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 13.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropDownContainer(
                            items: cubit.filteredList!.choices.colors,
                            width: 150,
                            controller: cubit.colorController,
                            hint: 'Color',
                          ),
                          DropDownContainer(
                            items: cubit.filteredList!.choices.hairLength,
                            width: 150,
                            controller: cubit.hairLengthController,
                            hint: 'Hair Length',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 13.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          DropDownContainer(
                            items: cubit.houseTrainedItems,
                            width: 150,
                            controller: cubit.houseTrainedController,
                            hint: 'House Trained',
                          ),
                          DropDownContainer(
                            items: cubit.vaccinatedItems,
                            width: 150,
                            controller: cubit.vaccinatedController,
                            hint: 'Vaccinated',
                          ),
                        ],
                      ),
                      MaterialButton(
                        onPressed: () {
                          cubit.getPetsWithFilter(category);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(IconBroken.Filter_2),
                            Text('Filter'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: cubit.filteredList != null
                        ? cubit.filteredList!.data.length
                        : 1,
                    itemBuilder: (context, index) => cubit.filteredList != null
                        ? PetContainer(
                            petName: cubit.filteredList!.data[index].name,
                            userName:
                                cubit.filteredList!.data[index].user.firstName,
                            petImageUrl:
                                cubit.filteredList!.data[index].image[0],
                            forHome: false,
                      petModel: cubit.filteredList!,
                      index: index,
                          )
                        : Center(child: CircularProgressIndicator()),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.55,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
