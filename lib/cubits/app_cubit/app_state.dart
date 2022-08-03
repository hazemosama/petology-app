import 'package:flutter/material.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class ChangeIconState extends AppStates {}
