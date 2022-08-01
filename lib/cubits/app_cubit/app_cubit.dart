import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
}
