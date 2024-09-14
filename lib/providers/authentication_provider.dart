import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../main.dart';
import '../models/profileModel.dart';
import '../services/authentication_service.dart';
import '../utils/cache_helper.dart';
import '../utils/enum/request_result.dart';
import '../utils/enum/request_status.dart';
import '../utils/enum/shared_preference_keys.dart';

class AuthenticationProvider extends ChangeNotifier {
  AuthenticationService authenticationService = AuthenticationService();

  ProfileData? profileData;

  String? statusType;

  Timer? _timer;

  Timer? get timer => _timer;
  set timer(Timer? value) {
    _timer = value;
    notifyListeners();
  }

  bool obscureText = true;

  void showPassword() {
      obscureText = !obscureText;
      notifyListeners();
  }

  String codeOTP='';




  Future<ResponseResult>checkCode(
      {required String phoneNumber, required String countryCode, required String otp}) async {
    Status state = Status.error;
    dynamic message;

    await authenticationService
        .checkCode(phoneNumber, countryCode, otp)
        .then((value) {
      if (value.status == Status.success) {
        state = Status.success;
        message = value.message;
        profileData = value.data;
        CacheHelper.saveData(key: CacheKey.loggedIn, value: true);
      } else {
        message = value.message;
      }
    });
    notifyListeners();
    return ResponseResult(state, profileData, message: message);
  }


  //-------------------------------------------- change Language -------

  void changeLanguage(context) {
    if (Intl.getCurrentLocale() == 'ar') {
      MyApp.setLocale(context, const Locale("en"));
    } else {
      MyApp.setLocale(context, const Locale("ar"));
    }
    notifyListeners();
  }


}
