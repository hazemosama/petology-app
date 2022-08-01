import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petology/models/facebook_auth_model.dart';
import 'package:petology/network/end_points.dart';
import 'package:petology/network/remote/dio_helper.dart';

part 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  FacebookAuthModel? facebookAuthModel;

  Future<void> facebookLogin() async {
    String? fbToken;
    FacebookAuth.instance.login().then((value) {
      fbToken = value.accessToken!.token;
      emit(SocialLoginLoadingState());
      facebookAuth(fbToken!);
    });
    emit(FacebookLoginSuccessState());
  }

  Future<void> googleLogin() async {
    String? googleToken;
    await GoogleSignIn().signIn().then(
      (value) {
        value!.authentication.then(
          (value) {
            googleToken = value.accessToken;
            print(value.idToken);
          },
        );
      },
    ).catchError(
      (error) {},
    );
    emit(GoogleLoginSuccessState());
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

  void googleAuth(String googleToken) {
    DioHelper.postData(
      url: EndPoints.fbLogin,
      data: {'auth_token': googleToken},
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
