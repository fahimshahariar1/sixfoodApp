


import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixamfoodapp/data/model/address_model.dart';
import 'package:sixamfoodapp/util/app_constants.dart';
import 'package:http/http.dart' as http;

import '../model/error_response.dart';

class ApiClient extends GetxService {
  late final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  String? token;
  late Map<String, String> _mainHeaders;

  ApiClient(this.sharedPreferences, {required this.appBaseUrl}){
    token = sharedPreferences.getString(AppConstants.token);
    if(kDebugMode){
      debugPrint('Token : $token');
    }
    AddressModel? addressModel;
    try {
      addressModel = AddressModel.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.userAddress)!));
    }catch (_){}
    updateHeader(
      token, addressModel?.zoneIds,
      sharedPreferences.getString(AppConstants.languageCode), addressModel?.latitude,
      addressModel?.longitude
    );
  }


  Map<String, String> updateHeader(String? token, List<int>? zoneIDs, String? languageCode, String? latitude, String? longitude, {bool setHeader = true}) {
    Map<String, String> header = {};
    header.addAll({
      'Content-Type': 'application/json; charset=UTF-8',
      AppConstants.zoneId: zoneIDs != null ? jsonEncode(zoneIDs) : '',
      AppConstants.localizationKey: languageCode ?? AppConstants.languages[0].languageCode!,
      AppConstants.latitude: latitude != null ? jsonEncode(latitude) : '',
      AppConstants.longitude: longitude != null ? jsonEncode(longitude) : '',
      'Authorization': 'Bearer $token'
    });
    if(setHeader) {
      _mainHeaders = header;
    }
    return header;
  }


  Future<Response?> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
      }
      http.Response response = await http.get(
        Uri.parse(appBaseUrl + uri),
        headers: headers ?? _mainHeaders,
      );
      return handleResponse(response, uri);
    } catch (e) {
      if (kDebugMode) {
        print('----------------${e.toString()}');
      }

      throw e;
    }
  }


  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    }catch(_) {}
    Response response0 = Response(
      body: body ?? response.body, bodyString: response.body.toString(),
      request: Request(headers: response.request!.headers, method: response.request!.method, url: response.request!.url),
      headers: response.headers, statusCode: response.statusCode, statusText: response.reasonPhrase,
    );
    if(response0.statusCode != 200 && response0.body is !String) {
      if(response0.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: errorResponse.errors![0].message);
      }else if(response0.body.toString().startsWith('{message')) {
        response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: response0.body['message']);
      }
    }else if(response0.statusCode != 200) {

    }
    if(kDebugMode) {
      debugPrint('====> API Response: [${response0.statusCode}] $uri\n${response0.body}');
    }
    return response0;
  }
}


