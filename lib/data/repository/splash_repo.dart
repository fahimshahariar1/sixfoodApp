
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/util/app_constants.dart';

class SplashRepo {
  ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  SplashRepo(
      {required this.sharedPreferences, required this.apiClient});

  Future<Response> getConfigData() async {
    Response response = await apiClient.getData(
        AppConstants.configUri);
    return response;
  }

  Future<bool> initSharedData() {
    if (!sharedPreferences.containsKey(
        AppConstants.theme)) {
      sharedPreferences.setBool(
          AppConstants.theme, false);
    }
    if (!sharedPreferences.containsKey(
        AppConstants.countryCode)) {
      sharedPreferences.setString(
          AppConstants.countryCode,
          AppConstants.languages[0].countryCode!);
    }
    if (!sharedPreferences.containsKey(
        AppConstants.languageCode)) {
      sharedPreferences.setString(
          AppConstants.languageCode,
          AppConstants.languages[0]
              .languageCode!);
    }
    if (!sharedPreferences.containsKey(
        AppConstants.cartList)) {
      sharedPreferences.setStringList(
          AppConstants.cartList, []);
    }
    if (!sharedPreferences.containsKey(
        AppConstants.searchHistory)) {
      sharedPreferences.setStringList(
          AppConstants.searchHistory, []);
    }
    if (!sharedPreferences.containsKey(
        AppConstants.notification)) {
      sharedPreferences.setBool(
          AppConstants.notification, true);
    }
    if (!sharedPreferences.containsKey(
        AppConstants.intro)) {
      sharedPreferences.setBool(
          AppConstants.intro, true);
    }
    if (!sharedPreferences.containsKey(
        AppConstants.notificationCount)) {
      sharedPreferences.setInt(
          AppConstants.notificationCount, 0);
    }
    return Future.value(true);
  }

  void disableIntro() {
    sharedPreferences.setBool(
        AppConstants.intro, false);
  }

  bool? showIntro() {
    return sharedPreferences.getBool(
        AppConstants.intro);
  }

  bool getSavedCookiesData() {
    return sharedPreferences.getBool(
        AppConstants.acceptCookies) ?? false;
  }

  Future<void> saveCookiesData(bool data) async {
    try {
      await sharedPreferences.setBool(
          AppConstants.acceptCookies, data);
    } catch (e) {
      rethrow;
    }
  }

  void cookiesStatusChange(String? data) {
    if (data != null) {
      sharedPreferences.setString(
          AppConstants.cookiesManagement, data);
    }
  }

  bool getAcceptCookiesStatus(String data) =>
      sharedPreferences.getString(
          AppConstants.cookiesManagement) != null
          && sharedPreferences.getString(
          AppConstants.cookiesManagement) == data;


}