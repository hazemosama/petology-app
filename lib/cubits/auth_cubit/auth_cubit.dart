import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:petology/models/facebook_auth_model.dart';
import 'package:petology/network/end_points.dart';
import 'package:petology/network/remote/dio_helper.dart';

part 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  FacebookAuthModel? facebookAuthModel;
  String? fbToken;

  Future<void> facebookLogin() async {
    FacebookAuth.instance.login().then((value) {
      fbToken = value.accessToken!.token;
      facebookAuth(fbToken!);
    });
    emit(FacebookLoginSuccessState());
  }

  void facebookAuth(String fbToken) {
    DioHelper.postData(
      url: EndPoints.fbLogin,
      data: {'auth_token': fbToken},
    ).then((value) {
      facebookAuthModel = FacebookAuthModel.fromJson(value.data);
      emit(
        FacebookAuthSuccessState(facebookAuthModel!.data.access),
      );
    }).catchError((error) {
      emit(FacebookAuthErrorState());
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
//