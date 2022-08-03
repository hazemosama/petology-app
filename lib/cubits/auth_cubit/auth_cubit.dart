import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petology/models/Signup_model.dart';
import 'package:petology/models/facebook_auth_model.dart';
import 'package:petology/models/login_model.dart';
import 'package:petology/network/end_points.dart';
import 'package:petology/network/remote/dio_helper.dart';

part 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);

//------------------Login && Signup with facebook account------------------------//
  SocialAuthModel? socialAuthModel;

  Future<void> facebookAuth() async {
    String? fbToken;
    FacebookAuth.instance.login().then((value) {
      fbToken = value.accessToken!.token;
      facebookLogin(fbToken!);
    });
  }

  void facebookLogin(String fbToken) {
    emit(SocialLoginLoadingState());
    DioHelper.postData(
      url: EndPoints.fbLogin,
      data: {'auth_token': fbToken},
    ).then((value) {
      socialAuthModel = SocialAuthModel.fromJson(value.data);
      emit(SocialLoginSuccessState(socialAuthModel!.data.access),);
    }).catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  //------------------Login && Signup with Google account------------------------//

  Future<void> googleLogin() async {
    await GoogleSignIn().signIn().then(
      (value) {
        value!.authentication.then(
          (value) {
            googleAuth(value.idToken!);
            print(value.idToken);
          },
        );
      },
    ).catchError(
      (error) {
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }

  void googleAuth(String googleToken) {
    emit(SocialLoginLoadingState());
    DioHelper.postData(
      url: EndPoints.google,
      data: {'auth_token': googleToken},
    ).then((value) {
      socialAuthModel = SocialAuthModel.fromJson(value.data);
      emit(SocialLoginSuccessState(socialAuthModel!.data.access));
    }).catchError((error) {
      emit(SocialLoginErrorState(error.toString()));
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  //------------------Login with email-----------------------------//
  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: EndPoints.login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel!.data.access));
    }).catchError((error) {
      print('error is الالا = ${error.toString()}');
      emit(LoginErrorState(error.toString()));
    });
  }

//--------------------signup with full data ------------------------//
  SignUpModel? signupModel;

  void userSignup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String country,
  }) {
    emit(SignupLoadingState());
    DioHelper.postData(
      url: EndPoints.signup,
      data: {
        'email': email,
        'password': password,
        'first_name': firstName,
        'last_name': lastName,
        'phoneNumber': phoneNumber,
        'country': country,
      },
    ).then((value) {
      signupModel = SignUpModel.fromJson(value.data);
      print(value.data);
      emit(SignupSuccessState(signupModel));
    }).catchError((error) {
      print('error is = ${error.toString()}');
      emit(SignupErrorState(error.toString()));
    });
  }
}
