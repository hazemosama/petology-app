import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/models/pets_model.dart';
import 'package:petology/network/end_points.dart';
import 'package:petology/network/remote/dio_helper.dart';
import 'package:petology/screens/home_screen.dart';
import 'package:petology/screens/kind_screen.dart';
import 'package:petology/screens/request_Screen.dart';
import 'package:petology/screens/services_screen.dart';
import 'package:petology/utils/app_constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const KindScreen(),
    RequestScreen(),
    const ServicesScreen()
  ];

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: 'Category',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.remove_from_queue_sharp),
      label: 'Request',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz),
      label: 'Services',
    ),
  ];

  void changeIcon(index) {
    currentIndex = index;
    emit(ChangeIconState());
  }
  PetModel? petModel;

  void getPets() async {
    AppConstants.refreshToken(refreshToken).then((value) {
      emit(PetsLoadingsState());
      DioHelper.getData(url:EndPoints.pets,token: token).then((value){
        petModel=PetModel.fromJson(value.data);
        emit(PetsSuccessState());
      }).catchError((error){
        emit(PetsErrorState());
      });
    }).catchError((error) {
    });
  }
}
