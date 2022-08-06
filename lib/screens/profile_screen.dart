import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/themes/colors.dart';


class ProfileScreen extends StatelessWidget {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  ProfileScreen({Key? key}) : super(key: key);

  static const String routeName = '/profile';


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        // var user = cubit.getProfileModel!.data;

        // firstNameController.text = user.firstName.capitalize();
        // lastNameController.text = user.lastName.capitalize();
        // nameController.text = user.username;
        // dateOfBirthController.text = user.dateOfBirth;
        // genderController.text = user.gender;
        // phoneController.text = user.phone;
        // countryController.text = user.country;
        // emailController.text = user.email;
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: AppColors.darkBrown,
                statusBarIconBrightness: Brightness.light),
            backgroundColor: AppColors.darkBrown,
            centerTitle: true,
            title: const Text(
              'Profile',
              style: TextStyle(
                fontSize: 17.5,
              ),
            ),
          ),
          body: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: AppColors.darkBrown,
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      color: AppColors.lightBrown,
                    ),
                    flex: 4,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  right: 20.0,
                  left: 20.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 55.0,
                                  backgroundImage: true
                                      ? AssetImage(
                                    'assets/images/male.png',
                                  )
                                      : AssetImage(
                                    'assets/images/female.png',
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        'hazem',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkBrown,
                                        ),
                                      ),
                                      Text(
                                        'hazemosama',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.darkBrown,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          UserDataField(
                            controller: firstNameController,
                            icon: Icons.person_rounded,
                            width: 150,
                          ),
                          Spacer(),
                          UserDataField(
                            controller: lastNameController,
                            icon: Icons.person_rounded,
                            width: 150,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        controller: nameController,
                        icon: Icons.account_circle_rounded,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        icon: Icons.cake_rounded,
                        controller: dateOfBirthController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        icon: Icons.male_rounded,
                        controller: genderController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        icon: Icons.phone_rounded,
                        controller: phoneController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        icon: Icons.language_rounded,
                        controller: countryController,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      UserDataField(
                        controller: emailController,
                        icon: Icons.email_rounded,
                        readOnly: true,
                      ),
                      SizedBox(
                        height: 35.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            textColor: Colors.white,
                            color: AppColors.darkBrown,
                            child: Row(
                              children: [
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
                            onPressed: () {
                            },
                            minWidth: 170.0,
                          ),
                          Spacer(),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            textColor: Colors.white,
                            color: AppColors.darkBrown,
                            child: Text('Update'),
                            onPressed: () {},
                            minWidth: 170.0,
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
            contentPadding: EdgeInsets.all(10),
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              size: 20,
            ),
          ),
        ),
      );
}
