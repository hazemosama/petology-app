part of 'auth_cubit.dart';

@immutable
abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class SocialLoginLoadingState extends AuthStates {}

class SocialLoginSuccessState extends AuthStates {
  final String? token;

  SocialLoginSuccessState(this.token);
}

class SocialLoginErrorState extends AuthStates {
  final String? error;

  SocialLoginErrorState(this.error);
}

class LoginLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  final String? token;

  LoginSuccessState(this.token);
}

class LoginErrorState extends AuthStates {
  final String error;

  LoginErrorState(this.error);
}

class SignupLoadingState extends AuthStates {}
class PostSuccessState extends AuthStates {}

class SignupSuccessState extends AuthStates {
  final SignUpModel? model;

  SignupSuccessState(this.model);
}

class SignupErrorState extends AuthStates {
  final String error;

  SignupErrorState(this.error);
}
