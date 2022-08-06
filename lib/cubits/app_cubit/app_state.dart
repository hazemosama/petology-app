import 'package:flutter/material.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class ChangeIconState extends AppStates {}

class PetsLoadingsState extends AppStates {}

class PetsSuccessState extends AppStates {}

class PetsErrorState extends AppStates {}
