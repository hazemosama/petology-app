class RequestModel {
  RequestModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  RequestModel.fromJson(Map<String, dynamic> json){
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
    required this.name,
    required this.ages,
    required this.category,
    required this.size,
    required this.breed,
    required this.gender,
    required this.hairLength,
    required this.color,
    required this.houseTranied,
    required this.description,
    required this.location,
    required this.phone,
    required this.vacciated,
  });
  late final String name;
  late final String ages;
  late final Category category;
  late final String size;
  late final String breed;
  late final String gender;
  late final String hairLength;
  late final String color;
  late final String houseTranied;
  late final String description;
  late final String location;
  late final String phone;
  late final String vacciated;

  Data.fromJson(Map<String, dynamic> json){
    name = json['name'];
    ages = json['ages'];
    category = Category.fromJson(json['category']);
    size = json['size'];
    breed = json['breed'];
    gender = json['gender'];
    hairLength = json['hair_length'];
    color = json['color'];
    houseTranied = json['house_tranied'];
    description = json['description'];
    location = json['location'];
    phone = json['phone'];
    vacciated = json['vacciated'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['ages'] = ages;
    _data['category'] = category.toJson();
    _data['size'] = size;
    _data['breed'] = breed;
    _data['gender'] = gender;
    _data['hair_length'] = hairLength;
    _data['color'] = color;
    _data['house_tranied'] = houseTranied;
    _data['description'] = description;
    _data['location'] = location;
    _data['phone'] = phone;
    _data['vacciated'] = vacciated;
    return _data;
  }
}

class Category {
  Category({
    required this.catId,
    required this.catName,
  });
  late final int catId;
  late final String catName;

  Category.fromJson(Map<String, dynamic> json){
    catId = json['cat_id'];
    catName = json['cat_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cat_id'] = catId;
    _data['cat_name'] = catName;
    return _data;
  }
}