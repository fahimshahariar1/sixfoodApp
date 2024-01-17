import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/banner_controller.dart';
import 'package:sixamfoodapp/controller/splash_controller.dart';
import 'package:sixamfoodapp/data/model/basic_campaign_model.dart';

import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/view/base/custom_image.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerController) {
      return (bannerController.bannerImageList != null && bannerController.bannerImageList!.isEmpty) ? const SizedBox() :

    Container(
      color: Colors.red,
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                aspectRatio: 3.3,
                enlargeFactor: 0.3,
                autoPlay: true,
                enlargeCenterPage: true,
                disableCenter: true,
                autoPlayInterval: const Duration(seconds: 7),
                onPageChanged: (index, reason) {
                  bannerController.setCurrentIndex(index, true);
                },
              ),
              itemCount: bannerController.bannerImageList.length,
              itemBuilder: (context, index, _) {
               String? baseUrl = bannerController.bannerDataList![index] is BasicCampaignModel ? Get.find<SplashController>().configModel!.baseUrls!.campaignImageUrl:
               Get.find<SplashController>().configModel!.baseUrls!.bannerImageUrl;
                return Container(
                  margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: GetBuilder<SplashController>(builder: (splashController){
                      return Container(height: 500, color: Colors.red,);
                    },)
                  ),
                );
              },
            ),
          ],
        ),
      );
      });
  }
}



