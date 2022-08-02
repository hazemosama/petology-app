class SignupModel {

  late final String firstName;
  late final String lastName;
  late final String email;
  late final String password;
  late final String phoneNumber;
  late final String country;
  SignupModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.country,
  });

  SignupModel.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    password = json['password'];
    phoneNumber = json['phoneNumber'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['password'] = password;
    _data['phoneNumber'] = phoneNumber;
    _data['country'] = country;
    return _data;
  }
}