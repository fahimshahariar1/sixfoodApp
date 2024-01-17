
import 'package:sixamfoodapp/data/model/language_model.dart';

class AppConstants {

  static const fontFamily = "Poppins";
  static const secondFontFamily = "Roboto";

  //API
  static const baseUrl = "https://stackfood-admin.6amtech.com";
  static const bannerUri = "/api/v1/banners";
  static const String categoryUri = '/api/v1/categories';


  //Key
  static const String token = "multivendor_token";
  static const String userAddress = 'user_address';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String zoneId = 'zoneId';
  static const String localizationKey = 'X-localization';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';



  //Languages

  static List<LanguageModel> languages = [
    LanguageModel(languageName: 'English', countryCode: 'US', languageCode: 'en'),

  ];


}