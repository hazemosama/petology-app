import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';
  var formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var user = cubit.userModel!.data;

        firstNameController.text = user.firstName;
        lastNameController.text = user.lastName;
        emailController.text = user.email;
        phoneController.text = user.phoneNumber;
        countryController.text = user.country;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: AppColors.darkBrown,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: AppColors.darkBrown,
            title: Row(
              children: [
                SvgPicture.asset(
                  ImageAssets.logo,
                  height: 30.0,
                ),
              ],
            ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.infinity,
                      color: AppColors.darkBrown,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 60.0,
                  right: 20.0,
                  left: 20.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                const CircleAvatar(
                                  radius: 55.0,
                                  backgroundColor: Colors.white,
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Center(
                                  child: Column(
                                    children:  [
                                      if (state is LoadingUpdateUserState)
                                        const LinearProgressIndicator(),
                                      Text(
                                        '${cubit.userModel!.data.firstName}',
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkBrown,
                                        ),
                                      ),
                                      Text(
                                        '@ ${cubit.userModel!.data.firstName}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkBrown,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          UserDataField(
                            controller: firstNameController,
                            icon: Icons.person_rounded,
                            width: 160,
                          ),
                          const Spacer(),
                          UserDataField(
                            controller: lastNameController,
                            icon: Icons.person_rounded,
                            width: 160,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        controller: emailController,
                        icon: Icons.email_rounded,
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        icon: Icons.phone_rounded,
                        controller: phoneController,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        icon: Icons.language_rounded,
                        controller: countryController,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            textColor: Colors.white,
                            color: AppColors.darkBrown,
                            onPressed: () {},
                            minWidth: 170.0,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.lock_rounded,
                                  size: 19.5,
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Text(
                                  'Change Password',
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            textColor: Colors.white,
                            color: AppColors.darkBrown,
                            onPressed: () {
                              AppCubit.get(context).updateUserData(
                                  firstname: firstNameController.text,
                                  lastname: lastNameController.text,
                                  email: emailController.text,
                                  phoneNumber: phoneController.text,
                                  country: countryController.text);
                            },
                            minWidth: 170.0,
                            child: const Text('Update'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget UserDataField({
    required IconData icon,
    controller,
    double width = double.infinity,
    bool readOnly = false,
  }) =>
      Container(
        width: width,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: TextField(
          readOnly: readOnly,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              size: 20,
            ),
          ),
        ),
      );
}
