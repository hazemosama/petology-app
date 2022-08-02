import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:petology/constants/app_constants.dart';
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
  FacebookAuthModel? facebookAuthModel;

  Future<void> facebookLogin() async {
    String? fbToken;
    FacebookAuth.instance.login().then((value) {
      fbToken = value.accessToken!.token;
      emit(SocialLoginLoadingState());
      facebookAuth(fbToken!);
      emit(FacebookLoginSuccessState());
    });
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

  //------------------Login && Signup with Google account------------------------//

  Future<void> googleLogin() async {
    String? googleToken;
    await GoogleSignIn().signIn().then(
      (value) {
        value!.authentication.then(
          (value) {
            googleToken = value.accessToken;
            print(value.idToken);
            emit(GoogleLoginSuccessState());
          },
        );
      },
    ).catchError(
      (error) {
        print(error.toString());
      },
    );
  }

  // void googleAuth(String googleToken) {
  //   DioHelper.postData(
  //     url: EndPoints.fbLogin,
  //     data: {'auth_token': googleToken},
  //   ).then((value) {
  //     facebookAuthModel = FacebookAuthModel.fromJson(value.data);
  //     emit(
  //       FacebookAuthSuccessState(facebookAuthModel!.data.access),
  //     );
  //   }).catchError((error) {
  //     emit(FacebookAuthErrorState());
  //     if (kDebugMode) {
  //       print(error.toString());
  //     }
  //   });
  // }

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
