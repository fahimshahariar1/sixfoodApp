import 'package:get/get.dart';
import 'package:sixamfoodapp/data/api/api_checker.dart';
import 'package:sixamfoodapp/data/model/basic_campaign_model.dart';
import 'package:sixamfoodapp/data/model/product_model.dart';
import 'package:sixamfoodapp/data/repository/campaign_repo.dart';



class CampaignController extends GetxController implements GetxService {
  final CampaignRepo campaignRepo;
  CampaignController({required this.campaignRepo});

  List<BasicCampaignModel>? _basicCampaignList;
  BasicCampaignModel? _campaign;
  List<Product>? _itemCampaignList;
  int _currentIndex = 0;

  List<BasicCampaignModel>? get basicCampaignList => _basicCampaignList;
  BasicCampaignModel? get campaign => _campaign;
  List<Product>? get itemCampaignList => _itemCampaignList;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if(notify) {
      update();
    }
  }

  Future<void> getItemCampaignList(bool reload) async {
    if (_itemCampaignList == null || reload) {
      Response response = await campaignRepo.getItemCampaignList();
      if (response.statusCode == 200) {
        _itemCampaignList = [];
        try {
          var responseBody = response.body;
          if (responseBody != null && responseBody is List) {
            _itemCampaignList!.addAll(responseBody
                .map((campaign) => Product.fromJson(campaign))
                .where((product) => product != null)
                .cast<Product>());
          } else {
            print('Error: Response body is not a List: $responseBody');
          }
        } catch (e) {
          print('Error parsing response body: $e');
        }
      } else {
        ApiChecker.checkApi(response);
      }
      update();
    }
  }


}