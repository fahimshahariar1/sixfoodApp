
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
  static const String loginUri = '/api/v1/auth/login';
  static const String updateProfileUri = '/api/v1/customer/update-profile';
  static const String customerInfoUri = '/api/v1/customer/info';


  //Key
  static const String theme = 'theme';
  static const String token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxMyIsImp0aSI6IjA2Y2E2ZDUwNTg2MWUwNzgyMzBiZWUzNmVlNGU1YmE1MWJlYzE2ZWM5MDYxZmU2YjE0NTNhODM1Nzk0MDIzMmQ5YWM5MTQ2MTAxYjQ2YjU4IiwiaWF0IjoxNzA1ODMwMDU0Ljk1NzA2LCJuYmYiOjE3MDU4MzAwNTQuOTU3MDY1LCJleHAiOjE3Mzc0NTI0NTQuOTQ4MjM3LCJzdWIiOiIxMzQiLCJzY29wZXMiOltdfQ.GFQDBoPm0FZbrT_HCWu3d822B9a9fWSVkYPNX8qIEVf6WLGN48zFxg-5MJavK5NUC6MARnXROi5D7k65sFeNPLM9v0lbksMR4YyFg0j6LEbdN2SjgIz0GY7JVvNiZjcEAxfuQ2EynO3CinMF6kMhu1pEN5Uw2HbN91lO08i4oWOtP7YN1iAXuGJ0M-X8w_Lx2cfNAqkxJ-TuBvuQtxEQoRB5kmyj9CsVzWXjONNRltTKbPvaO8FaevvHjhsU_cjjkX09CmgPtD9gBB1HL6mXa5Gx_fqlQBadKiELr4IbDjpw4v2FLJLI9umisM_SUS2Yvc2YhDe6UwzsIscvHbmH_7mppCR_aUIWwqBukRjRA93LrNaLsWylkBkGcw9gnFI2Ih02Hy60WcTHYzoy1TSJeuNkjUCcq9CBjFUG73zCWhmVT0o3lxuinrNGeAzDP8eSeIZNInzguNWap8Y4ThH52tpr_EgUA4BQ2MK8Jq6FKb8CMgHpnN4lenjQFdIt1eG3FD2K8UK97rfxq073XQxyKs5MvoSVdY3S8YSkerqx6YMY3B5AtgQXB5Ra_fAeX7QxucVxr3dAMy9ixOr_AvsJDJyFUsGpDZJr7GsDbCtjwRQi8Zm3rDFK1cQSDjMRNP0tvXJcUkUTvA80T-wlHlwd-Qh8lLWIB716dTC6TTCgim8';
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