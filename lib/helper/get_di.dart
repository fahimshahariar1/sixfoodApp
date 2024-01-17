
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/data/model/language_model.dart';
import 'package:sixamfoodapp/data/repository/banner_repo.dart';
import 'package:sixamfoodapp/data/repository/category_repo.dart';
import 'package:sixamfoodapp/util/app_constants.dart';



  Future<Map<String, Map<String, String>>> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => ApiClient(sharedPreferences: Get.find(), appBaseUrl: AppConstants.baseUrl));


    Get.lazyPut(() => BannerRepo(apiClient: Get.find()));
    Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));

    Map<String, Map<String, String>> languages = {};
    for(LanguageModel languageModel in AppConstants.languages) {
      String jsonStringValues = await rootBundle.loadString('assets/languages/${languageModel.languageCode}.json');
      Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
      Map<String, String> json = {};
      mappedJson.forEach((key, value) {
        json[key] = value.toString();
        });
        languages ['${languageModel.languageCode}_${languageModel.countryCode}'] = json;
  }
    return languages;
}