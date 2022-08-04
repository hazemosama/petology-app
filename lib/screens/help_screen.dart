import 'package:flutter/material.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/widgets/default_form_field.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({Key? key}) : super(key: key);
  static const routeName = '/help';
  var formKey = GlobalKey<FormState>();
  var categoryController = TextEditingController();
  var locationController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/ph.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
              top: 25,
              left: 20,
              right: 20,
              child: Container(
                height: 630,
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
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Help your friend',
                            style: TextStyle(
                              color: AppColors.darkBrown,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 40),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.photo_camera,
                                  size: 80,
                                  color: AppColors.darkBrown,
                                )),
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultFormField(
                                width: 400,
                                hint: 'Category',
                                controller: categoryController,
                                keyboardType: TextInputType.emailAddress,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'email must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Text(
                                'Detect your current location',
                                style: TextStyle(
                                  color: AppColors.darkBrown,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              DefaultFormField(
                                width: 400,
                                controller: locationController,
                                hint: 'Location',
                                keyboardType: TextInputType.name,
                                suffix: Icons.location_on,
                                color: AppColors.darkBrown,
                                suffixPressed: (){},
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Location must not be empty';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
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
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
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
                          const SizedBox(
                            height: 20.0,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: AppColors.lightBrown,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            minWidth: 400.0,
                            height: 60,
                            child: const Text(
                              'Call',
                              style: TextStyle(
                                color: AppColors.darkBrown,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
