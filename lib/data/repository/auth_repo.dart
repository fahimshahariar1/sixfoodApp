import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/data/model/address_model.dart';
import 'package:sixamfoodapp/util/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo(
      {required this.apiClient, required this.sharedPreferences});


  Future<Response> updateToken(
      {String notificationDeviceToken = ''})



  Future<Response> login(
      {String? phone, String? password}) async {
    Map<String, String> data = {
      "phone": phone!,
      "password": password!,
    };
    return await apiClient.postData(
        AppConstants.loginUri, data);
  }


  Future<bool> saveUserToken(String token, {bool alreadyInApp = false}) async {
    apiClient.token = token;
    if (alreadyInApp && sharedPreferences.getString(AppConstants.userAddress) != null) {
      AddressModel? addressModel = AddressModel.fromJson(jsonDecode(
          sharedPreferences.getString(AppConstants.userAddress)!));

      apiClient.updateHeader(token, addressModel.zoneIds, sharedPreferences.getString(AppConstants.languageCode), addressModel.latitude, addressModel.longitude,
      );
    } else {
      apiClient.updateHeader(token, null, sharedPreferences.getString(AppConstants.languageCode), null, null);
    }

    return await sharedPreferences.setString(
        AppConstants.token, token);
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }

}