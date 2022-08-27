class FilterModel {
  FilterModel({
    required this.status,
    required this.message,
    required this.data,
    required this.choices,
  });
  late final bool status;
  late final String message;
  late final List<Data> data;
  late final Choices choices;

  FilterModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    choices = Choices.fromJson(json['choices']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['choices'] = choices.toJson();
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
  late final String gender;
  late final String hairLength;
  late final String color;
  late final String houseTranied;
  late final String description;
  late final String location;
  late final String phone;
  late final String vacciated;
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

class Choices {
  Choices({
    required this.breed,
    required this.ages,
    required this.size,
    required this.goodWith,
    required this.gender,
    required this.colors,
    required this.hairLength,
    required this.behaviour,
  });
  late final List<String> breed;
  late final List<String> ages;
  late final List<String> size;
  late final List<String> goodWith;
  late final Gender gender;
  late final List<String> colors;
  late final List<String> hairLength;
  late final List<String> behaviour;

  Choices.fromJson(Map<String, dynamic> json){
    breed = List.castFrom<dynamic, String>(json['breed']);
    ages = List.castFrom<dynamic, String>(json['ages']);
    size = List.castFrom<dynamic, String>(json['size']);
    goodWith = List.castFrom<dynamic, String>(json['goodWith']);
    gender = Gender.fromJson(json['gender']);
    colors = List.castFrom<dynamic, String>(json['colors']);
    hairLength = List.castFrom<dynamic, String>(json['hairLength']);
    behaviour = List.castFrom<dynamic, String>(json['behaviour']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['breed'] = breed;
    _data['ages'] = ages;
    _data['size'] = size;
    _data['goodWith'] = goodWith;
    _data['gender'] = gender.toJson();
    _data['colors'] = colors;
    _data['hairLength'] = hairLength;
    _data['behaviour'] = behaviour;
    return _data;
  }
}

class Gender {
  Gender({
    required this.male,
    required this.female,
  });
  late final int male;
  late final int female;

  Gender.fromJson(Map<String, dynamic> json){
    male = json['male'];
    female = json['female'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['male'] = male;
    _data['female'] = female;
    return _data;
  }
}