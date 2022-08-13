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
      icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.category),
      label: 'Category',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.remove_from_queue_sharp),
      label: 'Request',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz),
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
      DioHelper.getData(url:EndPoints.pets,token: token).then((value){
        petModel=PetModel.fromJson(value.data);
        if (kDebugMode) {
          print(value.data);
        }
        emit(PetsSuccessState());
      }).catchError((error){
        if (kDebugMode) {
          print('get pets error is ${error.toString()}');
        }
        emit(PetsErrorState());
      });
    }).catchError((error) {
    });
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
      }).onError((error, stackTrace) {
      });
    }).onError((error, stackTrace) {
    });
  }

  Future<void> sendRequest() async {}

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
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
  Position? position;

  String address ='';

  TextEditingController locationController = TextEditingController();

  Future<void> getAddressFromLatLong()async {
    position = await determinePosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(position!.latitude, position!.longitude);
    // print(placemarks);
    Placemark place = placemarks[1];
    address = '${place.thoroughfare},${place.locality}, ${place.administrativeArea},${place.country}';
    print(place);
    locationController.text = address;
    if (kDebugMode)
    {
      print(address);
    }
  }
}
