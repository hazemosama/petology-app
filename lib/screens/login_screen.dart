import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petology/widgets/default_form_field.dart';

import '../themes/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBrown,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 22.0,
            ),
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SvgPicture.asset(
                  'assets/images/dog.svg',
                  width: 210,
                  height: 180,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 173),
                  child: Center(
                    child: Container(
                      height: 500,
                      width: 320,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.25,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Form(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColors.darkBrown,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              DefaultFormField(
                                hint: 'Email',
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              DefaultFormField(
                                hint: 'Password',
                                isPassword: true,
                              ),
                              const SizedBox(
                                height: 25.0,
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
                                height: 3.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5.0),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Forget Password?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2!
                                            .copyWith(
                                              color: AppColors.darkBrown,
                                            ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 50.0,
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
                                    width: 90.0,
                                    height: 1.0,
                                    color: AppColors.darkBrown,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 25.0,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MaterialButton(
                                    onPressed: () {},
                                    color: const Color(0xFF2F4582),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    minWidth:
                                        100,
                                    height: 50,
                                    child: Row(
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
                                  MaterialButton(
                                    onPressed: () {},
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    minWidth:
                                        MediaQuery.of(context).size.width *
                                            0.35,
                                    height: 50,
                                    child: Row(
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
                                ],
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
        ),
      ),
    );
  }
}
