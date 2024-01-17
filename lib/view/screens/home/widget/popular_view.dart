import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/popular_controller.dart';
import 'package:sixamfoodapp/data/model/popular_model.dart';

class PopularFoodView extends StatelessWidget {
  final bool isPopular;
  const PopularFoodView({super.key, required this.isPopular});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularController>(builder: (popularController) {
      List<Products>? foodList = isPopular ? popularController.popularProductList : popularController.popularProductList;
      return (foodList != null && foodList.isEmpty) ? const SizedBox() : Column(
        children: [
          Row(
            children: [
              Text('popular'.tr),
              Text('view'.tr),
            ],
          )
        ],
      );
    });
  }
}
