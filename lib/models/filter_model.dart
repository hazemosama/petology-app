class FilterModel {
  FilterModel({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final List<Data> data;

  FilterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.image,
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
    required this.date,
    required this.user,
  });
  late final int id;
  late final String name;
  late final List<String> image;
  late final String ages;
  late final Category category;
  late final String size;
  late final String breed;
  late final bool gender;
  late final String hairLength;
  late final String color;
  late final bool houseTranied;
  late final String description;
  late final String location;
  late final String phone;
  late final bool vacciated;
  late final String date;
  late final User user;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    image = List.castFrom<dynamic, String>(json['image']);
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
    date = json['date'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['image'] = image;
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
    _data['date'] = date;
    _data['user'] = user.toJson();
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

class User {
  User({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.country,
  });
  late final int userId;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phoneNumber;
  late final String country;

  User.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['phone_number'] = phoneNumber;
    _data['country'] = country;
    return _data;
  }
}