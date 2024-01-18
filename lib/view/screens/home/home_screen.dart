import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/banner_controller.dart';
import 'package:sixamfoodapp/controller/campaign_controller.dart';
import 'package:sixamfoodapp/controller/category_controller.dart';
import 'package:sixamfoodapp/controller/popular_controller.dart';
import 'package:sixamfoodapp/controller/splash_controller.dart';

import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/util/images.dart';
import 'package:sixamfoodapp/util/styles.dart';
import 'package:sixamfoodapp/view/screens/home/widget/banner_widget.dart';
import 'package:sixamfoodapp/view/screens/home/widget/category_view.dart';
import 'package:sixamfoodapp/view/screens/home/widget/food_campaign.dart';
import 'package:sixamfoodapp/view/screens/home/widget/popular_view.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Future<void> loadData(bool reload) async {
    await Get.find<SplashController>().getConfigData();
    await Get.find<BannerController>().getBannerList(reload);
    await Get.find<CategoryController>().getCategoryList(reload);
    await Get.find<CampaignController>().getItemCampaignList(reload);
    await Get.find<PopularController>().getPopularProductList(reload, 'all', false);
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    HomeScreen.loadData(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        height: Dimensions.paddingSizeLarge,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Padding ( padding: const EdgeInsets.only(left: Dimensions.paddingSizeDefault),
                child: Icon(Icons.home_filled, color: Theme.of(context).primaryColor,),
              ),
              Padding ( padding: const EdgeInsets.only(left: Dimensions.paddingSizeMedium),
                child: Icon(Icons.favorite_outline_rounded, color: Theme.of(context).focusColor,),
              ),
            ],
            ),
            Row(
              children: [
                Padding (padding: const EdgeInsets.only(right: Dimensions.paddingSizeMedium),
                  child: Icon(Icons.insert_page_break_outlined, color: Theme.of(context).focusColor,),
                ),
                Padding (padding: const EdgeInsets.only(right: Dimensions.paddingSizeDefault),
                  child: Icon(Icons.menu, color: Theme.of(context).focusColor,),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: Center(child: Padding(
        padding: const EdgeInsets.only(top: 730, left: 5),
        child: Container(height: Dimensions.paddingSizeLarge, width: Dimensions.paddingSizeLarge,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(Dimensions.paddingSizeLarge)
            ),

            child: const Icon(Icons.shopping_cart_rounded,
              size: Dimensions.paddingSizeMedium, color: Colors.white,)),)),



      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              child: Padding(
                padding: const EdgeInsets.only(top: Dimensions.paddingSizeLarge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home_rounded, color: Theme.of(context).indicatorColor, size: Dimensions.imageSizeSmall,),
                        Text('user_address'.tr, style: poppinsMedium.copyWith(color: Theme.of(context).indicatorColor, fontSize: Dimensions.fontSizeDefault)),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.updateLocale(const Locale('bn', 'BN'));
                      },
                      child: Image.asset(Images.notify, height: Dimensions.imageSizeSmall),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall, vertical: Dimensions.paddingSizeDefault),
              child: Container(
                height: Dimensions.paddingSizeLarge,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
                  boxShadow: [
                    BoxShadow(blurRadius: 1, spreadRadius: 1, color: Colors.grey[200]!, offset: const Offset(0, 1)),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("search".tr, style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeSmall, color: Theme.of(context).hintColor)),
                    Icon(CupertinoIcons.search, color: Theme.of(context).hintColor),
                  ],
                ),
              ),
            ),
             const BannerView(),
             const CategoryView(),
            const SizedBox(height: Dimensions.paddingSizeDefault,),
             const PopularFoodView(isPopular: true,),
             const FoodCampaign(),


            Padding(padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall),

              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("restaurant".tr,
                    style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).secondaryHeaderColor)),

                  Icon(Icons.filter_list_rounded, color: Theme.of(context).secondaryHeaderColor,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
