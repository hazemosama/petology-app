import 'package:flutter/material.dart';
import 'package:petology/models/user_model.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class ChangeIconState extends AppStates {}

class PetsLoadingsState extends AppStates {}

class PetsSuccessState extends AppStates {}

class PetsErrorState extends AppStates {}
class LoadingUserInfoState extends AppStates {}
class SuccessUserInfoState extends AppStates {
  final UserModel userModel;

  SuccessUserInfoState(this.userModel);
}
class ErrorUserInfoState extends AppStates {
  final String error;

  ErrorUserInfoState(this.error);
}
class LoadingUpdateUserState extends AppStates {}
class SuccessUpdateUserState extends AppStates {
  final UserModel userModel;

  SuccessUpdateUserState(this.userModel);
}
class ErrorUpdateUserState extends AppStates {
  final String error;

  ErrorUpdateUserState(this.error);
}

class EmitFilterState extends AppStates {}
