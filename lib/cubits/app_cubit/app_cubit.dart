import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petology/cubits/app_cubit/app_state.dart';
import 'package:petology/models/pets_model.dart';
import 'package:petology/models/user_model.dart';
import 'package:petology/network/end_points.dart';
import 'package:petology/network/remote/dio_helper.dart';
import 'package:petology/screens/home_screen.dart';
import 'package:petology/screens/kind_screen.dart';
import 'package:petology/screens/request_Screen.dart';
import 'package:petology/screens/services_screen.dart';
import 'package:petology/utils/app_constants.dart';

import '../../models/filter_model.dart';
import '../../models/request_model.dart';
import '../../themes/icon_borken.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const KindScreen(),
    RequestScreen(),
    const ServicesScreen()
  ];

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Category),
      label: 'Category',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.Camera),
      label: 'Request',
    ),
    const BottomNavigationBarItem(
      icon: Icon(IconBroken.More_Circle),
      label: 'Services',
    ),
  ];

  void changeIcon(index) {
    currentIndex = index;
    emit(ChangeIconState());
  }

  PetModel? petModel;

  void getPets() async {
    AppConstants.refreshToken(refreshToken).then((value) {
      emit(PetsLoadingsState());
      DioHelper.getData(url: EndPoints.pets, token: token).then((value) {
        petModel = PetModel.fromJson(value.data);
        if (kDebugMode) {
          print(value.data);
        }
        emit(PetsSuccessState());
      }).catchError((error) {
        if (kDebugMode) {
          print('get pets error is ${error.toString()}');
        }
        emit(PetsErrorState());
      });
    }).catchError((error) {});
  }

  //--------------get user info--------------//
  UserModel? userModel;

  Future<void> getUserData() async {
    emit(LoadingUserInfoState());
    DioHelper.getData(
      url: EndPoints.userInfo,
      token: token,
    ).then((value) {
      userModel = UserModel.fromJson(value.data);
      print('get user data is ${value.data}');
      emit(SuccessUserInfoState(userModel!));
    }).catchError((error) {
      print('get user data error is: ${error.toString()}');
      emit(ErrorUserInfoState(error.toString()));
    });
  }

//--------------update user info--------------//
  Future<void> updateUserData({
    required String firstname,
    required String lastname,
    required String email,
    required String phoneNumber,
    required String country,
  }) async {
    emit(LoadingUpdateUserState());
    await DioHelper.putData(url: EndPoints.userInfo, token: token, data: {
      'first_name': firstname,
      'last_name': lastname,
      'email': email,
      'phoneNumber': phoneNumber,
      'country': country,
    }).then((value) {
      print(value.data);
      // userModel = UserModel.fromJson(value.data);
      emit(SuccessUpdateUserState(userModel!));
    }).catchError((error) {
      if (kDebugMode) {
        print('update user error is: ${error.toString()}');
      }
      emit(ErrorUpdateUserState(error.toString()));
    });
  }

  //-----------------request------------------//

  File? petImage;
  var picker = ImagePicker();

  Future<void> getPetImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      petImage = File(pickedFile.path);
      emit(UploadPetImageState());
      uploadPetImage();
    } else {
      if (kDebugMode) {
        print('no image selected');
      }
    }
  }

  String petImageUrl = '';

  void uploadPetImage() {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('pets/${Uri.file(petImage!.path).pathSegments.last}')
        .putFile(petImage!)
        .then((picture) {
      picture.ref.getDownloadURL().then((value) {
        petImageUrl = value;
        print(petImageUrl);
        petImage = null;
      }).onError((error, stackTrace) {});
    }).onError((error, stackTrace) {});
  }

  RequestModel? requestModel;

  Future<void> sendRequest({
    String? name,
    String? image,
    String? ages,
    String? category,
    String? size,
    String? breed,
    String? gender,
    String? hair_length,
    String? color,
    String? house_tranied,
    String? description,
    String? location,
    String? phone,
    String? vacciated,
  }) async {
    await DioHelper.postData(
        url: '/event/animal/',
        token: token,
        isAuth: true,
        data: {
          'name': name,
          'image': [image],
          'ages': ages,
          'category': category,
          'size': size,
          'breed': breed,
          'gender': gender,
          'hair_length': hair_length,
          'color': color,
          'house_tranied': house_tranied,
          'description': description,
          'location': location,
          'phone': phone,
          'vacciated': vacciated,
        }).then((value) {
      print(value.data);
      requestModel = RequestModel.fromJson(value.data);
      emit(RequestSuccessState());
    }).catchError((error) {
      emit(RequestErrorState());
      print(error.toString());
    });
  }

  // ----------------------- location ------------------------ \\

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Position? position;

  String address = '';

  TextEditingController locationController = TextEditingController();

  Future<void> getAddressFromLatLong() async {
    position = await determinePosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position!.latitude, position!.longitude);
    Placemark place = placemarks[1];
    address =
        '${place.thoroughfare},${place.locality}, ${place.administrativeArea},${place.country}';
    print(place);
    locationController.text = address;
    if (kDebugMode) {
      print(address);
    }
  }

  //------------------------ filters ---------------------

  final List<String> categoryItems = [
    '1',
    '2',
  ];
  final List<String> ageItems = [
    "0-2 months",
    "3-4 months",
    "5-6 months",
    "7-8 months",
    "9-10 months",
    "10-12 months",
    "1-2 years",
    "3-5 years",
    "6-8 years",
    "9+ years",
  ];

  final List<String> sizeItems = [
    'small',
    'medium',
    'large',
  ];

  final List<String> breedItems = [
    "aegean",
    "american Bobtail",
    "australian Mist",
    "burmilla",
    "chartreux",
    "dogo",
    "german Shepherd",
    "great Dane",
    "kangal",
    "pitbull",
  ];

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  final List<String> houseTrainedItems = [
    'Yes',
    'No',
  ];

  final List<String> hairLengthItems = [
    "short",
    "medium",
    "tall",
  ];
  final List<String> vaccinatedItems = [
    'Yes',
    'No',
  ];
  final List<String> colorItems = [
    "yellow",
    "orange",
    "antique bronze",
    "artichoke green",
    "black olive",
  ];
  FilterModel? filteredList;
  TextEditingController colorController = TextEditingController();
  TextEditingController breedController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController hairLengthController = TextEditingController();
  TextEditingController houseTrainedController = TextEditingController();
  TextEditingController vaccinatedController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  void getPetsWithFilter(String? category) {
    DioHelper.getData(url: EndPoints.filters, token: token, query: {
      'category__cat_name': category!,
      'ages': ageController.text,
      'size': sizeController.text,
      'gender': genderController.text,
      'breed': breedController.text,
      'hair_length': hairLengthController.text,
      'color': colorController.text,
      'vacciated': vaccinatedController.text,
      'house_tranied': houseTrainedController.text,

    }).then((value) {
      filteredList = FilterModel.fromJson(value.data);
      emit(EmitFilterState());
      print(value.data);
    });
  }

  Future<void> getCategory({
    required String category,
  }) async {
    await DioHelper.getData(url: '${EndPoints.filters}?category__cat_name=$category', token: token,).then((value) {
      filteredList = FilterModel.fromJson(value.data);
      emit(EmitFilterState());
      print(value.data);
    });
  }
}
