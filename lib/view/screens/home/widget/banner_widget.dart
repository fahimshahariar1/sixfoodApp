import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/banner_controller.dart';
import 'package:sixamfoodapp/data/model/basic_campaign_model.dart';

import 'package:sixamfoodapp/util/dimensions.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerController) {
      if (bannerController.bannerImageList == null || bannerController.bannerImageList.isEmpty) {
        return const SizedBox();
      }

      return Container(
        child: Column(
          children: [
            CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                autoPlayAnimationDuration: const Duration(milliseconds: 500),
                enlargeCenterPage: false,
                enableInfiniteScroll: true,
                viewportFraction: 0.8,
                scrollDirection: Axis.horizontal,
                pageViewKey: const PageStorageKey<String>('carousel_slider'),
                onPageChanged: (index, reason) {
                  bannerController.setCurrentIndex(index, true);
                },
              ),
              itemCount: bannerController.bannerImageList.length,
              itemBuilder: (context, index, _) {
                BasicCampaignModel banner = bannerController.bannerImageList[index] as BasicCampaignModel;
                return Container(
                  margin: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      banner.image.toString(),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
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



