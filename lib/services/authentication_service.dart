
import 'package:intl/intl.dart';

import '../base/service/base_service.dart';
import '../models/profileModel.dart';
import '../utils/apis.dart';
import '../utils/cache_helper.dart';
import '../utils/enum/request_result.dart';
import '../utils/enum/request_status.dart';
import '../utils/enum/request_types.dart';
import '../utils/enum/shared_preference_keys.dart';
import 'package:http/http.dart' as http;


class AuthenticationService extends BaseService {

  Future<ResponseResult> checkCode(
      String phoneNumber, String countryCode, String otp) async {
    Status status = Status.error;
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'lang': Intl.getCurrentLocale() == 'ar' ? 'ar' : 'en',
    };
    dynamic message;
    Map<String, dynamic> body = {
      "phone": phoneNumber,
      "otp": otp,
      "country_code": countryCode,
      "fcm_token":'await FirebaseService.getDeviceToken()'
    };
    ProfileData? profileData;
    try {
      await requestFutureData(
          api: Api.checkCode,
          body: body,
          headers: headers,
          jsonBody: true,
          requestType: Request.post,
          onSuccess: (response) {
            if (response["status_code"] == 200) {
              status = Status.success;
              message = response["message"];

              profileData = LoginProfileModel.fromJson(response).data!.users;
              CacheHelper.saveData(key: CacheKey.loggedIn, value: true);
              CacheHelper.saveData(
                  key: CacheKey.token,
                  value: "Bearer ${response["data"]["token"]}");

            } else if (response["status_code"] == 400) {
              status = Status.codeNotCorrect;
              message = response["message"];
            }
          });
    } catch (e) {
      status = Status.error;
      logger.e("Error in checking OTP code $e");
    }
    return ResponseResult(status, profileData, message: message);
  }

  Future<ResponseResult> registerOrLogin(
      String phoneNumber, String countryCode) async {
    Status status = Status.error;
    Map<String, String> headers = {
      'lang': Intl.getCurrentLocale() == 'ar' ? 'ar' : 'en',
    };
    dynamic message;
    Map<String, dynamic> body = {
      "phone": phoneNumber,
      "country_code": countryCode
    };
    try {
      await requestFutureData(
          api: Api.registerOrLogin,
          body: body,
          headers: headers,
          requestType: Request.post,
          onSuccess: (response) async {
            if (response["status_code"] == 200) {
              status = Status.success;

              message = response["message"];
/*
              await CacheHelper.saveData(
                  key: CacheKey.phoneNumber, value: phoneNumber);
              await CacheHelper.saveData(
                  key: CacheKey.countryCode, value: countryCode);*/
            } else if (response["status_code"] == 400) {
              status = Status.invalidEmailOrPass;
              message = response["message"];
            }
          });
    } catch (e) {
      status = Status.error;
      logger.e("Error Signing in $e");
    }
    return ResponseResult(status, '', message: message);
  }







}
