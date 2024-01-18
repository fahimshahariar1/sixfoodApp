import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/popular_controller.dart';
import 'package:sixamfoodapp/controller/splash_controller.dart';

import 'package:sixamfoodapp/data/model/product_model.dart';
import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/util/images.dart';
import 'package:sixamfoodapp/util/styles.dart';
import 'package:sixamfoodapp/view/base/custom_image.dart';

class PopularFoodView extends StatelessWidget {
  final bool isPopular;
  const PopularFoodView({Key? key, required this.isPopular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularController>(builder: (popularController) {
      List<Product>? foodList = isPopular ? popularController.popularProductList : popularController.popularProductList;
      return (foodList != null && foodList.isEmpty) ? const SizedBox()
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, bottom: Dimensions.paddingSizeSmall,
                left: Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("popular".tr, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
                ),
                Text("view".tr, style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeSmall,
                  decoration: TextDecoration.underline, color: Theme.of(context).primaryColor,
                ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: Dimensions.paddingExtraLarge,
            child: foodList != null ? ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: Dimensions.paddingSizeSmall),
              itemCount: foodList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, Dimensions.paddingSizeSmall, 2),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: Dimensions.containerSizeMedium,
                      width: Dimensions.containerSizeExtraLarge,
                      padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
                        boxShadow: const [BoxShadow(blurRadius: 5, spreadRadius: 1)],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
                                child: CustomImage(
                                  image: '${Get.find<SplashController>().configModel!.baseUrls!.productImageUrl}''/${foodList[index].image}',

                                  height: Dimensions.containerSizeDefault, width: Dimensions.containerSizeDefault,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Wrap(
                                    crossAxisAlignment: WrapCrossAlignment.center,
                                    children: [
                                      Text(
                                        foodList[index].name!,
                                        style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(width: Dimensions.paddingSizeSmall),
                                      (Get.find<SplashController>().configModel!.toggleVegNonVeg!)
                                          ? Image.asset(
                                        foodList[index].veg == 0 ? Images.notify : Images.placeholder,
                                        height: Dimensions.paddingSizeSmall, width: Dimensions.paddingSizeSmall,
                                        fit: BoxFit.contain,
                                      )
                                          : const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(height: Dimensions.paddingSizeSmall),
                                  Text(
                                    foodList[index].restaurantName!,
                                    style: robotoBold.copyWith(
                                        fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(foodList[index].price! as String),
                                            SizedBox(width: foodList[index].discount! > 0 ? Dimensions.paddingSizeSmall : 0),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.add, size: 20),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ) : Center(child: Text("No API Data")),

          ),
        ],
      );
    });
  }
}
