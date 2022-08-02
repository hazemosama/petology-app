part of 'auth_cubit.dart';

@immutable
abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class FacebookLoginSuccessState extends AuthStates {}

class FacebookAuthSuccessState extends AuthStates {
  final String? token;

  FacebookAuthSuccessState(this.token);
}

class FacebookAuthErrorState extends AuthStates {}

class GoogleLoginSuccessState extends AuthStates {}

class SocialLoginLoadingState extends AuthStates {}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final String? token;

  LoginSuccessState(this.token);
}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

class SignupLoadingState extends AuthStates {

}

class SignupSuccessState extends AuthStates {

}

class SignupErrorState extends AuthStates {
  final String error;

  SignupErrorState(this.error);
}
