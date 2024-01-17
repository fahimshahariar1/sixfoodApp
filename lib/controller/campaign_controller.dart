import 'package:get/get.dart';
import 'package:sixamfoodapp/data/api/api_checker.dart';
import 'package:sixamfoodapp/data/model/basic_campaign_model.dart';
import 'package:sixamfoodapp/data/model/product_model.dart';
import 'package:sixamfoodapp/data/repository/campaign_repo.dart';



class CampaignController extends GetxController implements GetxService{
  final CampaignRepo campaignRepo;
  CampaignController({required this.campaignRepo});


  List<BasicCampaignModel>? _basicCampaignList;
  BasicCampaignModel? _campaign;
  List<Product>? itemCampaignList = [];
  int _currentIndex = 0;

  List<BasicCampaignModel>? get basicCampaignList => _basicCampaignList;
  BasicCampaignModel? get campaign => _campaign;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if(notify) {
      update();
    }
  }


  Future<void> getItemCampaignList(bool reload) async {
    if (itemCampaignList == null || reload) {
      Response response = await campaignRepo.getItemCampaignList();
      if (response.statusCode == 200) {
        itemCampaignList = [];
        response.body.forEach((campaign) =>
            itemCampaignList!.add(Product.fromJson(campaign)));
        update();
      } else {
        ApiChecker.checkApi(response);
      }
    }
  }



}