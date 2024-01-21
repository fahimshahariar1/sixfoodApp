import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/splash_controller.dart';
import 'package:sixamfoodapp/controller/user_controller.dart';
import 'package:sixamfoodapp/data/model/response_model.dart';
import 'package:sixamfoodapp/data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo}){

  }

  bool _isLoading = false;


  Future<ResponseModel> login(String? phone, String password, {bool alreadyInApp = false}) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(phone: phone, password: password);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      if(Get.find<SplashController>().configModel!.customerVerification! && response.body['is_phone_verified'] == 0) {

      }else {
        authRepo.saveUserToken(response.body['token'], alreadyInApp: alreadyInApp);

        Get.find<UserController>().getUserInfo();

      }
      responseModel = ResponseModel(true, '${response.body['is_phone_verified']}${response.body['token']}');
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    _isLoading = false;
    update();
    return responseModel;
  }





  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }


}