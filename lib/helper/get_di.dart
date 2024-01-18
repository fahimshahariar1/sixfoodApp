
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixamfoodapp/controller/banner_controller.dart';
import 'package:sixamfoodapp/controller/campaign_controller.dart';
import 'package:sixamfoodapp/controller/category_controller.dart';
import 'package:sixamfoodapp/controller/popular_controller.dart';
import 'package:sixamfoodapp/controller/splash_controller.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/data/model/language_model.dart';
import 'package:sixamfoodapp/data/repository/banner_repo.dart';
import 'package:sixamfoodapp/data/repository/campaign_repo.dart';
import 'package:sixamfoodapp/data/repository/category_repo.dart';
import 'package:sixamfoodapp/data/repository/popular_repo.dart';
import 'package:sixamfoodapp/data/repository/splash_repo.dart';
import 'package:sixamfoodapp/util/app_constants.dart';



  Future<Map<String, Map<String, String>>> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    Get.lazyPut(() => sharedPreferences);
    Get.lazyPut(() => ApiClient(sharedPreferences: Get.find(), appBaseUrl: AppConstants.baseUrl));


    Get.lazyPut(() => BannerRepo(apiClient: Get.find()));
    Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));
    Get.lazyPut(() => SplashRepo(sharedPreferences: Get.find(), apiClient: Get.find()));
    Get.lazyPut(() => PopularRepo(apiClient: Get.find()));
    Get.lazyPut(() => CampaignRepo(apiClient: Get.find()));


    //Controller

    Get.lazyPut(() => BannerController(bannerRepo: Get.find()));
    Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));
    Get.lazyPut(() => SplashController(splashRepo: Get.find(),));
    Get.lazyPut(() => PopularController(popularRepo: Get.find()));
    Get.lazyPut(() => CampaignController(campaignRepo: Get.find()));

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