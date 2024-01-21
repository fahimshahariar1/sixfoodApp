import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sixamfoodapp/data/api/api_checker.dart';
import 'package:sixamfoodapp/data/model/response_model.dart';
import 'package:sixamfoodapp/data/model/user_model.dart';
import 'package:sixamfoodapp/data/repository/user_repo.dart';



class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  UserInfoModel? _userInfoModel;
  XFile? _pickedFile;


  UserInfoModel? get userInfoModel => _userInfoModel;
  XFile? get pikedFile => _pickedFile;

  Future <ResponseModel> getUserInfo() async {
    _pickedFile = null;
    _userInfoModel = null;
    ResponseModel responseModel;
    Response response = await userRepo.getUserInfo();
    if (response.statusCode == 200) {
      _userInfoModel = UserInfoModel.fromJson(response.body);
      responseModel = ResponseModel(true, 'successful');
    }else{

      responseModel = ResponseModel(false, response.statusText);
      ApiChecker.checkApi(response);
    }
    update();
    return responseModel;
  }

  void initData() {
    _pickedFile = null;
  }



}