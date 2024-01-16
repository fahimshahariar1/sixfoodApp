import 'package:get/get.dart';
import 'package:sixamfoodapp/data/model/banner_model.dart';
import 'package:sixamfoodapp/data/repository/banner_repo.dart';

class BannerController extends GetxController implements GetxService {
  final BannerRepo bannerRepo;
  BannerController({required this.bannerRepo});

   List<String?> _bannerImageList = [];
   List<dynamic> _bannerDataList = [];
  int _currentIndex = 0;

  List<String?> get bannerImageList => _bannerImageList;
  List<dynamic> get bannerDataList => _bannerDataList;

  int get currentIndex => _currentIndex;

  Future<void> getBannerList(bool reload) async {
    try {
      if (_bannerImageList.isEmpty || reload) {
        Response? response = await bannerRepo.getBannerList();
        if (response?.statusCode == 200) {
          _bannerImageList.clear();
          _bannerDataList.clear();

          final dynamic responseBody = response?.body;

          print('Response body: $responseBody');

          BannerModel? bannerModel;
          try {
            bannerModel = BannerModel.fromJson(responseBody);
          } catch (e) {
            print('Error parsing BannerModel: $e');
          }

          if (bannerModel != null) {
            _bannerImageList.addAll(bannerModel.campaigns
                ?.map((campaign) => campaign.image)
                .where((imageUrl) => imageUrl != null)
                .cast<String?>() ?? []);

// ...
            _bannerDataList.addAll(bannerModel.campaigns
                ?.where((campaign) => campaign.image != null)
                .toList() ?? []);

            _bannerImageList.addAll(bannerModel.banners
                ?.map((banner) => banner.image)
                .where((imageUrl) => imageUrl != null)
                .cast<String?>() ?? []);


            _bannerDataList.addAll(bannerModel.banners
                ?.where((banner) => banner.image != null)
                .map((banner) => banner.food)
                .toList() ?? []);
          } else {
            print('Error: BannerModel is null');
          }
        } else {
          print('Error: ${response?.statusCode}');
        }
      }
    } catch (e, stacktrace) {
      print('Error in getBannerList: $e\n$stacktrace');
    }
  }


  void setCurrentIndex(int index, bool notify) {
    _currentIndex = index;
    if (notify) {
      update();
    }
  }
}
