
class SignUpModel {
  late final bool status;
  late final String message;

  SignUpModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }
}
