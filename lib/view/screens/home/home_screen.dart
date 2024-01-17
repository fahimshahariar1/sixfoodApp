import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/util/images.dart';
import 'package:sixamfoodapp/util/styles.dart';
import 'package:sixamfoodapp/view/screens/home/widget/banner_widget.dart';
import 'package:sixamfoodapp/view/screens/home/widget/category_view.dart';
import 'package:sixamfoodapp/view/screens/home/widget/popular_view.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Row(children: [ Icon(Icons.home_rounded, color: Theme.of(context).indicatorColor,
                  size: Dimensions.imageSizeSmall,),
                  Text('user_address'.tr, style: poppinsMedium.copyWith(color: Theme.of(context).indicatorColor,
                  fontSize: Dimensions.fontSizeDefault))],),
                InkWell(onTap: (){
                  Get.updateLocale(Locale('bn', 'BN'));
                },
                    child: Image.asset(Images.notify, height: Dimensions.imageSizeSmall,))
                ]),

            ),
            // SizedBox(height: Dimensions.paddingSizeDefault,),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall,
                  vertical: Dimensions.paddingSizeDefault),
              child: Container(
                height: Dimensions.paddingSizeLarge,
                decoration: BoxDecoration(color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(Dimensions.radiusSizeSmall),
                    boxShadow:  [
                      BoxShadow(
                          blurRadius: 1, spreadRadius: 1, color: Colors.grey[200]!, offset: const Offset(0,1)
                      )
                    ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("search".tr, style: poppinsLight.copyWith(fontSize: Dimensions.fontSizeSmall,
                        color: Theme.of(context).hintColor),),
                    Icon(CupertinoIcons.search, color: Theme.of(context).hintColor,)
                  ],
                ),
              ),
            ),

             const BannerView(),
             const CategoryView(),
             const PopularFoodView(isPopular: true),
          ],

        ),
      ),
    );
  }
}
