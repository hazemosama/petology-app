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
