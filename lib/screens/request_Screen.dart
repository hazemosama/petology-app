import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';
import 'package:petology/widgets/deafult_drop_down_menu.dart';
import 'package:petology/widgets/default_form_field.dart';

class RequestScreen extends StatelessWidget {
  RequestScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var locationController = TextEditingController();
  var phoneController = TextEditingController();
  final List<String> genderItems = ['cat', 'dog'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                height: 1000,
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
                        Image.asset(ImageAssets.dogg,width: 300,height: 200,),
                        DefaultFormField(
                          controller: nameController,
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
                        DefaultDropDownMenu(
                          items: genderItems,
                          hint: 'Category',
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            DefaultDropDownMenu(
                              hint: 'Age',
                              items: genderItems,
                              width: 140,
                            ),
                            const Spacer(),
                            DefaultDropDownMenu(
                              hint: 'Size',
                              items: genderItems,
                              width: 140,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            DefaultDropDownMenu(
                              hint: 'Breed',
                              items: genderItems,
                              width: 140,
                            ),
                            const Spacer(),
                            DefaultDropDownMenu(
                              hint: 'Gender',
                              items: genderItems,
                              width: 140,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            DefaultDropDownMenu(
                              hint: 'Gender',
                              items: genderItems,
                              width: 140,
                            ),
                            const Spacer(),
                            DefaultDropDownMenu(
                              hint: 'Hair Length',
                              items: genderItems,
                              width: 140,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            DefaultDropDownMenu(
                              hint: 'House Trained',
                              items: genderItems,
                              width: 140,
                            ),
                            const Spacer(),
                            DefaultDropDownMenu(
                              hint: 'Color',
                              items: genderItems,
                              width: 140,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            DefaultDropDownMenu(
                              hint: 'Vaccinated',
                              items: genderItems,
                              width: 140,
                            ),
                            const Spacer(),
                            DefaultDropDownMenu(
                              hint: 'Gender',
                              items: genderItems,
                              width: 140,
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
                              controller: locationController,
                              hint: 'Location',
                              keyboardType: TextInputType.name,
                              suffix: Icons.location_on,
                              color: AppColors.darkBrown,
                              suffixPressed: () {},
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
                              controller: phoneController,
                              keyboardType: TextInputType.emailAddress,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Phone must not be empty';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            MaterialButton(
                              onPressed: () {},
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
      ),
    );
  }
}
