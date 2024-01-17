import 'package:get/get.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/util/app_constants.dart';

class PopularRepo extends GetxService {
  final ApiClient apiClient;
  PopularRepo({required this.apiClient});

  Future <Response> getPopularProductList(String type) async {
    return await apiClient.getData('${AppConstants.popularProductUri}?type=$type');
  }

}