import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/screens/about_us_screen.dart';
import 'package:petology/screens/help_screen.dart';
import 'package:petology/screens/kind_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const AboutUsScreen(),
    HelpScreen(),
    const KindScreen(),
  ];

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Help',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz),
      label: 'More',
    ),
  ];

  GlobalKey<ScaffoldState> homeKey = GlobalKey();

  void changeIcon(index) {

    if (index == 2) {
      homeKey.currentState!.openDrawer();
    } else {
      currentIndex = index;
      emit(ChangeIconState());
    }
  }
}
