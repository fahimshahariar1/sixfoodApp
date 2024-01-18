import 'package:get/get.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/data/model/config_model.dart';
import 'package:sixamfoodapp/data/repository/splash_repo.dart';


class SplashController extends GetxController implements GetxService {
  final SplashRepo splashRepo;
  SplashController({required this.splashRepo});

  ConfigModel? _configModel;


  ConfigModel? get configModel => _configModel;

  Future<bool> getConfigData() async {

    Response response = await splashRepo.getConfigData();
    bool isSuccess = false;
    if(response.statusCode == 200) {
      _configModel = ConfigModel.fromJson(response.body);
      print('=====CatBaseUrlFromConfig====>${_configModel?.baseUrls?.categoryImageUrl}');
      isSuccess = true;
    }else {
      isSuccess = false;
      }
    return isSuccess;
    }

  }
