import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/util/app_constants.dart';

class BannerRepo {
  final ApiClient apiClient;
  BannerRepo({required this.apiClient});

  Future<Response?> getBannerList() async {
    try {
      return await apiClient.getData(AppConstants.bannerUri);
    } catch (e) {

      print('Error in getBannerList: $e');
      return null;
    }
  }
}
