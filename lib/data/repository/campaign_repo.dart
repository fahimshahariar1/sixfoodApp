import 'package:get/get_connect/http/src/response/response.dart';

import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/util/app_constants.dart';

class CampaignRepo {
  final ApiClient apiClient;
  CampaignRepo({required this.apiClient});
  
  Future<Response> getItemCampaignList() async {
    return await apiClient.getData(AppConstants.itemCampaignUri);
  }
}