import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_cubit.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';

import '../network/end_points.dart';
import '../themes/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: BlocConsumer<AppCubit, AppStates>(
                listener: (context, state) {},
                builder: (context, state) => Text(
                    'Hi ${AppCubit.get(context).userModel!.data.firstName} ${AppCubit.get(context).userModel!.data.lastName} :)')),
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: Row(
              children: const [
                Text('Account Information'),
                Spacer(),
                Icon(Icons.account_box),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 25),
            child: MaterialButton(
              onPressed: () {
                signOut(context);
              },
              color: AppColors.darkBrown,
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(40),),
              height: 40,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
