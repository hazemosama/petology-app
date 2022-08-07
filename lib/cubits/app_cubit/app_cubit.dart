import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/models/pets_model.dart';
import 'package:petology/models/user_model.dart';
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
        if (kDebugMode) {
          print(value.data);
        }
        emit(PetsSuccessState());
      }).catchError((error){
        if (kDebugMode) {
          print('get pets error is ${error.toString()}');
        }
        emit(PetsErrorState());
      });
    }).catchError((error) {
    });
  }

  //--------------get user info--------------//
  UserModel? userModel;
  Future<void> getUserData() async {
    emit(LoadingUserInfoState());
    DioHelper.getData(
      url: EndPoints.userInfo,
      token: token,
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print('get user data is ${value.data}');
      emit(SuccessUserInfoState(userModel!));
    }).catchError((error) {
      print('get user data error is: ${error.toString()}');
      emit(ErrorUserInfoState(error.toString()));
    });
  }

//--------------update user info--------------//
  Future<void> updateUserData({
    required String firstname,
    required String lastname,
    required String email,
    required String phoneNumber,
    required String country,
  }) async {
    emit(LoadingUpdateUserState());
    await DioHelper.putData(url: EndPoints.userInfo, token: token, data: {
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'phoneNumber': phoneNumber,
      'country': country,
    }).then((value) {
      print(value.data);
      // userModel = UserModel.fromJson(value.data);
      emit(SuccessUpdateUserState(userModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print('update user error is: ${error.toString()}');
      }
      emit(ErrorUpdateUserState(error.toString()));
    });
  }
}
