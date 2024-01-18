import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/data/api/api_checker.dart';

import 'package:sixamfoodapp/data/model/product_model.dart';
import 'package:sixamfoodapp/data/repository/popular_repo.dart';

class PopularController extends GetxController implements GetxService {
  final PopularRepo popularRepo;
  PopularController({required this.popularRepo});


  List<Product>? _popularProductList;

  String _popularType = 'all';


  List<Product>? get popularProductList => _popularProductList;

  String get popularType => _popularType;



  Future<void> getPopularProductList(bool reload, String type, bool notify) async {
    _popularType = type;
    if (reload) {
      _popularProductList = [];
    }
    if (notify) {
      update();
    }
    if (_popularProductList == null || reload) {
      Response response = await popularRepo.getPopularProductList(type);
      if (kDebugMode) {
        print('API Status Code: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('API Response Body: ${response.body}');
      }

      if (response.statusCode == 200) {
        try {
          var productModel = ProductModel.fromJson(response.body);
          if (kDebugMode) {
            print('Parsed Product Model: $productModel');
          }

          if (productModel.products != null) {
            _popularProductList = [];
            _popularProductList!.addAll(productModel.products!);
            if (notify) {
              update();
            }
          } else {
            if (kDebugMode) {
              print('Error: Products list is null in the response.');
            }
          }
        } catch (e) {
          if (kDebugMode) {
            print('Error parsing JSON: $e');
          }
        }
      } else {
        ApiChecker.checkApi(response);
      }
    }
  }

}

