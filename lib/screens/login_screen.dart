import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/cubits/auth_cubit/auth_cubit.dart';
import 'package:petology/network/end_points.dart';
import 'package:petology/screens/home_layout.dart';
import 'package:petology/utils/app_constants.dart';
import 'package:petology/utils/assets_manager.dart';
import 'package:petology/widgets/default_form_field.dart';

import '../themes/colors.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is SocialLoginLoadingState || state is LoginLoadingState) {
            AppConstants.appShowDialog(
                context: context,
                content: const LinearProgressIndicator(),
                text: 'Logging in, please wait');
          } else if (state is SocialLoginSuccessState || state is LoginSuccessState) {
            AppCubit.get(context).getUserData().then((value) {
              Navigator.pushReplacementNamed(context, HomeLayout.routeName);
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: AppColors.lightBrown,
            body: SafeArea(
              bottom: false,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      SvgPicture.asset(
                        ImageAssets.loginDog,
                        width: 210,
                        height: 150,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 143),
                        child: Center(
                          child: Container(
                            height: 550,
                            width: 355,
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
                                      height: 25.0,
                                    ),
                                    DefaultFormField(
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
                                      hint: 'Password',
                                      controller: passwordController,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'password must not be empty';
                                        }
                                        return null;
                                      },
                                      isPassword: true,
                                    ),
                                    const SizedBox(
                                      height: 25.0,
                                    ),
                                    MaterialButton(
                                      onPressed: () {
                                        AuthCubit.get(context).userLogin(
                                            email: emailController.text,
                                            password: passwordController.text);
                                      },
                                      color: AppColors.darkBrown,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40)),
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
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: TextButton(
                                            onPressed: () {
                                              signOut(context);
                                            },
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
                                      height: 25.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: MaterialButton(
                                            onPressed: () {
                                              AuthCubit.get(context)
                                                  .facebookAuth();
                                            },
                                            color: const Color(0xFF2F4582),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  ImageAssets.fbLogo,
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
                                        const SizedBox(
                                          width: 20.0,
                                        ),
                                        Expanded(
                                          child: MaterialButton(
                                            onPressed: () {
                                              AuthCubit.get(context)
                                                  .googleLogin();
                                            },
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  ImageAssets.googleLogo,
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
                                      height: 8.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          'Didn\'t have an account?',
                                          style: TextStyle(
                                            color: AppColors.darkBrown,
                                            fontSize: 18,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                              context,
                                              '/sign-up',
                                            );
                                          },
                                          child: const Text(
                                            'sign up',
                                            style: TextStyle(
                                              color: AppColors.darkBrown,
                                              fontSize: 18,
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
