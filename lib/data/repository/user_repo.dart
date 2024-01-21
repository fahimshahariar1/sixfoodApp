
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/data/model/user_model.dart';
import 'package:sixamfoodapp/util/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;

  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(
        AppConstants.customerInfoUri);
  }

  Future<Response> updateProfile(
      UserInfoModel userInfoModel, XFile? data,
      String token) async {
    Map<String, String> body = {};
    body.addAll(<String, String>{
      'f_name': userInfoModel.fName!,
      'l_name': userInfoModel.lName!,
      'email': userInfoModel.email!
    });
    return await apiClient.postMultipartData(
        AppConstants.updateProfileUri, body,
        [MultipartBody('image', data)], []);
  }
}