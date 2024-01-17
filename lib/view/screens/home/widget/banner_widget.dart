import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/banner_controller.dart';
import 'package:sixamfoodapp/util/app_constants.dart';
import 'package:sixamfoodapp/util/dimensions.dart';

class BannerView extends StatelessWidget {
  const BannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BannerController>(builder: (bannerController) {
      List<String?>? bannerImageList = bannerController.bannerImageList;

      if (bannerImageList.isEmpty) {

        return Container();
      }

      return SizedBox(
        height: 100,
        child: CarouselSlider.builder(
          itemCount: bannerImageList.length,
          itemBuilder: (context, index, realIndex) {
            if (index < 0 || index >= bannerImageList.length) {
              return Container();
            }

            String? imagePath = bannerImageList[index];
            if (imagePath == null || imagePath.isEmpty) {
              return Container();
            }

            return ClipRRect(
              borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
              child: Image.network(AppConstants.baseUrl),
            );
          },
          options: CarouselOptions(
            height: 110,
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
        ),
      );
    });
  }
}


