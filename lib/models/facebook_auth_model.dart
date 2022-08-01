class FacebookAuthModel {
  FacebookAuthModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  FacebookAuthModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.country,
    required this.phoneNumber,
    required this.access,
    required this.refresh,
  });
  late final String firstName;
  late final String lastName;
  late final String email;
  late final dynamic country;
  late final String phoneNumber;
  late final String access;
  late final String refresh;

  Data.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    country = json['country'];
    phoneNumber = json['phoneNumber'];
    access = json['access'];
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['country'] = country;
    _data['phoneNumber'] = phoneNumber;
    _data['access'] = access;
    _data['refresh'] = refresh;
    return _data;
  }
}