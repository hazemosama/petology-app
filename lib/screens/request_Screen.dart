import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';
import 'package:petology/widgets/deafult_drop_down_menu.dart';
import 'package:petology/widgets/default_form_field.dart';

class RequestScreen extends StatelessWidget {
  RequestScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  TextEditingController colorRequestController = TextEditingController();
  TextEditingController breedRequestController = TextEditingController();
  TextEditingController genderRequestController = TextEditingController();
  TextEditingController ageRequestController = TextEditingController();
  TextEditingController sizeRequestController = TextEditingController();
  TextEditingController hairLengthRequestController = TextEditingController();
  TextEditingController houseTrainedRequestController = TextEditingController();
  TextEditingController vaccinatedRequestController = TextEditingController();
  TextEditingController categoryRequestController = TextEditingController();
  TextEditingController nameRequestController = TextEditingController();
  TextEditingController phoneRequestController = TextEditingController();
  TextEditingController descriptionRequestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Stack(
            children: [
              Image.asset(
                ImageAssets.back2,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    height: AppCubit.get(context).petImage != null ? 1050 : 1000,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 1.25,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            const Text(
                              'Request',
                              style: TextStyle(
                                color: AppColors.darkBrown,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            InkWell(
                              child: ConditionalBuilder(
                                condition: cubit.petImage != null,
                                builder: (context) => Image.file(
                                  cubit.petImage!,
                                  height: 150,
                                  width: 150,
                                ),
                                fallback: (context) => const Icon(
                                  Icons.camera_alt,
                                  size: 100,
                                ),
                              ),
                              onTap: () {
                                AppCubit.get(context).getPetImage();
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DefaultFormField(
                              controller: nameRequestController,
                              hint: 'name',
                              keyboardType: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Name Must Not Be Empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 15),
                            DropDownContainer(
                              hint: 'Category',
                              items: cubit.categoryItems,
                              controller: categoryRequestController,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                DropDownContainer(
                                  hint: 'Age',
                                  items: cubit.ageItems,
                                  width: 140,
                                  controller: ageRequestController,
                                ),
                                const Spacer(),
                                DropDownContainer(
                                  hint: 'Size',
                                  items: cubit.sizeItems,
                                  width: 140,
                                  controller: sizeRequestController,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                DropDownContainer(
                                  hint: 'Breed',
                                  items: cubit.breedItems,
                                  width: 140,
                                  controller: breedRequestController,
                                ),
                                const Spacer(),
                                DropDownContainer(
                                  hint: 'Gender',
                                  items: cubit.genderItems,
                                  width: 140,
                                  controller: genderRequestController,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                DropDownContainer(
                                  hint: 'House Trained',
                                  items: cubit.houseTrainedItems,
                                  width: 140,
                                  controller: houseTrainedRequestController,
                                ),
                                const Spacer(),
                                DropDownContainer(
                                  hint: 'Hair Length',
                                  items: cubit.hairLengthItems,
                                  width: 140,
                                  controller: hairLengthRequestController,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                DropDownContainer(
                                  hint: 'Vaccinated',
                                  items: cubit.vaccinatedItems,
                                  width: 140,
                                  controller: vaccinatedRequestController,
                                ),
                                const Spacer(),
                                DropDownContainer(
                                  hint: 'Color',
                                  items: cubit.colorItems,
                                  width: 140,
                                  controller: colorRequestController,
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Detect your current location',
                                  style: TextStyle(color: AppColors.darkBrown),
                                ),
                                const SizedBox(height: 15),
                                DefaultFormField(
                                  width: 400,
                                  controller:
                                      AppCubit.get(context).locationController,
                                  hint: 'Location',
                                  keyboardType: TextInputType.name,
                                  suffix: Icons.location_on,
                                  color: AppColors.darkBrown,
                                  suffixPressed: () {
                                    AppCubit.get(context)
                                        .getAddressFromLatLong();
                                  },
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Location must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                DefaultFormField(
                                  width: 400,
                                  hint: 'Phone number',
                                  controller: phoneRequestController,
                                  keyboardType: TextInputType.phone,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Phone must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 15),
                                DefaultFormField(
                                  height: 120,
                                  width: 400,
                                  hint: 'Description',
                                  maxLines: 5,
                                  controller: descriptionRequestController,
                                  keyboardType: TextInputType.text,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Phone must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 20),
                                MaterialButton(
                                  onPressed: () {
                                    AppCubit.get(context).sendRequest(
                                      image: AppCubit.get(context).petImageUrl,
                                      color: colorRequestController.text,
                                      ages: ageRequestController.text,
                                      breed: breedRequestController.text,
                                      category: categoryRequestController.text,
                                      description:
                                          descriptionRequestController.text,
                                      gender: genderRequestController.text,
                                      hair_length:
                                          hairLengthRequestController.text,
                                      house_tranied:
                                          houseTrainedRequestController.text,
                                      location: AppCubit.get(context)
                                          .locationController
                                          .text,
                                      name: nameRequestController.text,
                                      phone: phoneRequestController.text,
                                      size: sizeRequestController.text,
                                      vacciated:
                                          vaccinatedRequestController.text,
                                    );
                                    formKey.currentState!.reset();
                                  },
                                  color: AppColors.darkBrown,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  minWidth: 400.0,
                                  height: 60,
                                  child: const Text(
                                    'Send',
                                    style: TextStyle(
                                      color: AppColors.lightBrown,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
