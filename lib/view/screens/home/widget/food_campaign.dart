import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/campaign_controller.dart';
import 'package:sixamfoodapp/controller/splash_controller.dart';
import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/util/styles.dart';
import 'package:sixamfoodapp/view/base/custom_image.dart';

class FoodCampaign extends StatelessWidget {
  const FoodCampaign({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CampaignController>(builder: (campaignController) {
      return (campaignController.itemCampaignList != null &&
          campaignController.itemCampaignList!.isEmpty)
          ? const SizedBox()
          : Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "food".tr, style: robotoBold.copyWith(
                  fontSize: Dimensions.fontSizeDefault, color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                Text(
                  "view".tr, style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeSmall, decoration: TextDecoration.underline,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(scrollDirection: Axis.horizontal,
              itemCount: campaignController.itemCampaignList?.length ?? 0, itemBuilder: (context, index) {
                return Container(
                  width: 120, child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.radiusSizeSmall),
                        ),
                        child: CustomImage(
                          image:
                          '${Get.find<SplashController>().configModel!.baseUrls!.campaignImageUrl}' +
                              '/${campaignController.itemCampaignList![index].image}',
                          height: Dimensions.containerSizeDefault, width: Dimensions.containerSizeLarge, fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                campaignController.itemCampaignList![index].name!, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                campaignController.itemCampaignList![index].restaurantName!,
                                style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).disabledColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(campaignController.itemCampaignList![index].price as String,
                                      style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.star, color: Theme.of(context).primaryColor, size: Dimensions.fontSizeDefault,
                                  ),
                                  Text(
                                    campaignController.itemCampaignList![index].avgRating!.toStringAsFixed(1),
                                    style: robotoBold.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}



