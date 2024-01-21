import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sixamfoodapp/data/model/address_model.dart';
import 'package:sixamfoodapp/data/model/error_response.dart';
import 'package:sixamfoodapp/util/app_constants.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';

class ApiClient extends GetxService {
  late final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  String? token;
  late Map<String, String> _mainHeaders;

  ApiClient({required this.sharedPreferences, required this.appBaseUrl}) {
    token = sharedPreferences.getString(AppConstants.token);
    if (kDebugMode) {
      debugPrint('Token: $token');
    }
    AddressModel? addressModel;
    try {
      addressModel = AddressModel.fromJson(jsonDecode(sharedPreferences.getString(AppConstants.userAddress)!));
    } catch (_) {}
    updateHeader(
      setHeader: true,
      token: token,
      zoneIDs: addressModel?.zoneIds,
      languageCode: sharedPreferences.getString(AppConstants.languageCode),
      latitude: addressModel?.latitude,
      longitude: addressModel?.longitude,
    );
  }

  Map<String, String> updateHeader(
      {
    bool setHeader = true,
    String? token,
    List<int>? zoneIDs,
    String? languageCode,
    String? latitude,
    String? longitude,
  }) {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
      AppConstants.zoneId: '[1]',
      AppConstants.localizationKey: languageCode ?? AppConstants.languages[0].languageCode!,
      AppConstants.latitude: latitude ?? '',
      AppConstants.longitude: longitude ?? '',
    };

    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }

    if (setHeader) {
      _mainHeaders = header;
    }

    return header;
  }



  Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
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
      return const Response(statusCode: 1);
    }
  }

  Future<Response> postData(String uri, dynamic body, {Map<String, String>? headers}) async {
    try {
      if (kDebugMode) {
        debugPrint('===> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('===> API Body: $body');
      }
      http.Response response = await http.post(
        Uri.parse(appBaseUrl + uri),
        body: jsonEncode(body),
        headers: headers ?? _mainHeaders,
      );
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1);
    }
  }

  Future<Response> postMultipartData(String uri, Map<String, String> body, List<MultipartBody> multipartBody, List<MultipartDocument> otherFile, {Map<String, String>? headers}) async {
    try {
      if(kDebugMode) {
        debugPrint('====> API Call: $uri\nHeader: $_mainHeaders');
        debugPrint('====> API Body: $body with ${multipartBody.length} and multipart ${otherFile.length}');
      }
      http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse(appBaseUrl+uri));
      request.headers.addAll(headers ?? _mainHeaders);
      for(MultipartBody multipart in multipartBody) {
        if(multipart.file != null) {
          Uint8List list = await multipart.file!.readAsBytes();
          request.files.add(http.MultipartFile(
            multipart.key, multipart.file!.readAsBytes().asStream(), list.length,
            filename: basename(multipart.file!.path), contentType: MediaType('image', 'jpg'),

          ));
        }
      }

      if(otherFile.isNotEmpty){
        for(MultipartDocument file in otherFile){
          File other = File(file.file!.files.single.path!);
          Uint8List list0 = await other.readAsBytes();
          var part = http.MultipartFile(file.key, other.readAsBytes().asStream(), list0.length, filename: basename(other.path));
          request.files.add(part);
        }
      }

      request.fields.addAll(body);
      http.Response response = await http.Response.fromStream(await request.send());
      return handleResponse(response, uri);
    } catch (e) {
        return Response (statusCode: 1);
    }
  }



      Response handleResponse(http.Response response, String uri) {
    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (_) {}
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      request: Request(headers: response.request!.headers, method: response.request!.method, url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != 200 && response0.body is! String) {
      if (response0.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response0.body);
        response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: errorResponse.errors![0].message);
      } else if (response0.body.toString().startsWith('{message')) {
        response0 = Response(statusCode: response0.statusCode, body: response0.body, statusText: response0.body['message']);
      }
    } else if (response0.statusCode != 200) {}

    if (kDebugMode) {
      debugPrint('====> API Response: [${response0.statusCode}] $uri\n${response0.body}');
    }
    return response0;
  }
}


class MultipartBody {
  String key;
  XFile? file;

  MultipartBody(this.key, this.file);
}

class MultipartDocument {
  String key;
  FilePickerResult? file;
  MultipartDocument(this.key, this.file);
}