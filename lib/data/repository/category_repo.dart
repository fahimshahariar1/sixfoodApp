
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/util/app_constants.dart';

class CategoryRepo {
  final ApiClient apiClient;
  CategoryRepo({required this.apiClient});


  Future<Response> getCategoryList() async {
    return await apiClient.getData(AppConstants.categoryUri);
  }
}