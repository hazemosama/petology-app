import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/screens/help_screen.dart';
import 'package:petology/themes/colors.dart';
import 'package:petology/utils/assets_manager.dart';
import 'package:petology/widgets/app_drawer.dart';
import '../cubits/app_cubit/app_cubit.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const routeName = '/home';


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        final AppCubit appCubit = AppCubit.get(context);
        return Scaffold(
          drawer: const AppDrawer(),
          appBar: AppBar(
            elevation: 0.0,
            title: SvgPicture.asset(
              ImageAssets.logo,
              height: 36.0,
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    HelpScreen.routeName,
                  );
                },
                icon: const Icon(Icons.photo_camera),
              ),
            ],
          ),
          body: appCubit.screens[appCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.darkBrown,
            unselectedItemColor: AppColors.medGray,
            currentIndex: appCubit.currentIndex,
            items: appCubit.navBarItems,
            onTap: (index) {
              appCubit.changeIcon(index);
            },
          ),
        );
      },
    );
  }
}