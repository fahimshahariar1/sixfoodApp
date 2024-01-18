import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/banner_controller.dart';
import 'package:sixamfoodapp/controller/splash_controller.dart';
import 'package:sixamfoodapp/data/model/basic_campaign_model.dart';
import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/util/styles.dart';


class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerController) {
      return (bannerController.bannerImageList != null && bannerController.bannerImageList!.isEmpty) ?
      const SizedBox() : Container( color: Colors.red,
          width: MediaQuery.of(context).size.width, height: 160,
      padding:  const EdgeInsets.only(top: Dimensions.paddingSizeDefault),
      child: bannerController.bannerImageList != null ?  Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
            itemCount: bannerController.bannerImageList!.isEmpty ? 1 : bannerController.bannerImageList!.length,
            itemBuilder: (context, index, _) {
              String? baseUrl = bannerController.bannerDataList![index] is BasicCampaignModel
                  ? Get.find<SplashController>().configModel!.baseUrls!.campaignImageUrl
                  : Get.find<SplashController>().configModel!.baseUrls!.bannerImageUrl;

              print("ImageBaseUrl===>${'$baseUrl/${bannerController.bannerImageList![index]}'}");

              return InkWell(
                onTap: () {

                },
                child: Container(
                  decoration: BoxDecoration(
                   color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[Get.isDarkMode ? 800 : 200]!,
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
                    child:  Image.network('$baseUrl/${bannerController.bannerImageList![index]}'),

            )
                  ));
            },
          ),
          const SizedBox(height: Dimensions.paddingSizeSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bannerController.bannerImageList!.map((bnr) {
              int index = bannerController.bannerImageList!.indexOf(bnr);
              int totalBanner = bannerController.bannerImageList!.length;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: index == bannerController.currentIndex ? Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor, borderRadius: BorderRadius.circular(Dimensions.radiusSizeDefault)),

                  child: Text('${(index) + 1}/$totalBanner', style: robotoBold.copyWith(color: Colors.white, fontSize: Dimensions.fontSizeDefault)),) :
                Container(
                  height: 4.18, width: 5.57,
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor.withOpacity(0.5), borderRadius: BorderRadius.circular(Dimensions.radiusSizeDefault)),
                ),
              );
            }).toList(),
          ),
        ],
      ) : Container());

    });
  }
}





