import 'package:get/get.dart';
import 'package:sixamfoodapp/data/api/api_checker.dart';
import 'package:sixamfoodapp/data/model/popular_model.dart';
import 'package:sixamfoodapp/data/repository/popular_repo.dart';

class PopularController extends GetxController implements GetxService {
  final PopularRepo popularRepo;
  PopularController({required this.popularRepo});


  List<Products>? _popularProductList;
  String _popularType = '';

  List<Products>? get popularProductList => _popularProductList;


  Future<void> getPopularProductList(bool reload, String type, bool notify) async {
    _popularType = type;
    if (reload) {
      _popularProductList = null;
    }
    if (notify) {
      update();
    }
    if (_popularProductList == null || reload){
      Response response = await popularRepo.getPopularProductList(type);
      if (response.statusCode == 200) {
        _popularProductList = [];
        _popularProductList!.addAll(PopularModel.fromJson(response.body).products as Iterable<Products>);
      }
      else {
        ApiChecker.checkApi(response);
      }
      update();
    }
  }

}