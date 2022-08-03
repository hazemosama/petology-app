import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/screens/home_screen.dart';
import 'package:petology/screens/help_screen.dart';
import 'package:petology/screens/kind_screen.dart';
import 'package:petology/screens/request_Screen.dart';
import 'package:petology/screens/services_screen.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const KindScreen(),
    const RequestScreen(),
    const ServicesScreen()
  ];

  List<BottomNavigationBarItem> navBarItems =
  [
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

  void changeIcon(index)
  {
    {
      currentIndex = index;
      emit(ChangeIconState());
    }
  }
}
