import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/widgets/default_form_field.dart';

class SignupScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var firstNController = TextEditingController();
  var lastNController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var countryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/backk.svg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 30,
              left: 20,
              child: Container(
                height: 750,
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
                            'Sign up',
                            style: TextStyle(
                              color: AppColors.darkBrown,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  color: const Color(0xFF2F4582),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/fb.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(
                                        width: 7.0,
                                      ),
                                      Text(
                                        'Facebook',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(
                                              color: Colors.white,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        'assets/icons/google.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(
                                        width: 7.0,
                                      ),
                                      Text(
                                        'Google',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 110.0,
                                height: 1.0,
                                color: AppColors.darkBrown,
                              ),
                              const Text(
                                'OR',
                                style: TextStyle(
                                  color: AppColors.darkBrown,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                width: 110.0,
                                height: 1.0,
                                color: AppColors.darkBrown,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          DefaultFormField(
                            width: 400,
                            controller: firstNController,
                            hint: 'First Name',
                            keyboardType: TextInputType.name,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'name must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          DefaultFormField(
                            width: 400,
                            hint: 'Last name',
                            controller: lastNController,
                            keyboardType: TextInputType.name,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'name must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          DefaultFormField(
                            width: 400,
                            hint: 'Email',
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'email must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          DefaultFormField(
                            width: 400,
                            hint: 'Password',
                            controller: passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'password must not be empty';
                              }
                              return null;
                            },
                            isPassword: true,
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          DefaultFormField(
                            width: 400,
                            hint: 'phone number',
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'phone must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          DefaultFormField(
                            width: 400,
                            controller: countryController,
                            hint: 'Country',
                            keyboardType: TextInputType.streetAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Country must not be empty';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          MaterialButton(
                            onPressed: () {},
                            color: AppColors.darkBrown,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40)),
                            minWidth: 300.0,
                            height: 60,
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: AppColors.lightBrown,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account?',
                                style: TextStyle(
                                  color: AppColors.darkBrown,
                                  fontSize: 18,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('Login',
                                      style: TextStyle(
                                          color: AppColors.darkBrown,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)))
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
      ),
    );
  }
}
