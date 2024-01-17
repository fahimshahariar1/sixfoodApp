
import 'package:sixamfoodapp/data/model/language_model.dart';

class AppConstants {

  static const fontFamily = "Poppins";
  static const secondFontFamily = "Roboto";

  //API
  static const baseUrl = "https://stackfood-admin.6amtech.com";
  static const String configUri = '/api/v1/config';
  static const bannerUri = "/api/v1/banners";
  static const String categoryUri = '/api/v1/categories';
  static const String popularProductUri = '/api/v1/products/popular';
  static const String itemCampaignUri = '/api/v1/campaigns/item';


  //Key
  static const String theme = 'theme';
  static const String token = 'multivendor_token';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String cartList = 'cart_list';
  static const String userPassword = 'user_password';
  static const String userAddress = 'user_address';
  static const String userNumber = 'user_number';
  static const String userCountryCode = 'user_country_code';
  static const String notification = 'notification';
  static const String searchHistory = 'search_history';
  static const String intro = 'intro';
  static const String notificationCount = 'notification_count';
  static const String notificationIdList = 'notification_id_list';
  static const String topic = 'all_zone_customer';
  static const String zoneId = 'zoneId';
  static const String localizationKey = 'X-localization';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String earnPoint = 'stackfood_earn_point';
  static const String acceptCookies = '6ammart_accept_cookies';
  static const String cookiesManagement = 'cookies_management';
  static const String dmTipIndex = 'stackfood_dm_tip_index';
  static const String walletAccessToken = '6ammart_wallet_access_token';
  static const String guestId = 'stackfood_guest_id';
  static const String guestNumber = 'stackfood_guest_number';



  //Languages

  static List<LanguageModel> languages = [
    LanguageModel(languageName: 'English', countryCode: 'US', languageCode: 'en'),

  ];


}