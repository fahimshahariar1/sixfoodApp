import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/category_controller.dart';
import 'package:sixamfoodapp/controller/splash_controller.dart';
import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/util/styles.dart';
import 'package:sixamfoodapp/view/base/custom_image.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (categoryController) {
          return (categoryController.categoryList != null && categoryController.categoryList!.isEmpty) ?
          const SizedBox() : Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: Dimensions.paddingSizeDefault, bottom: Dimensions.paddingSizeSmall,
                    left: Dimensions.paddingSizeSmall, right: Dimensions.paddingSizeSmall),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("category".tr, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault,
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
                Row(
                  children: [
                    Expanded(child: SizedBox(height: 70,child: categoryController.categoryList != null ?
                      ListView.builder(itemCount: categoryController.categoryList!.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index){

                          return InkWell(
                            onTap: () {},
                            child: SizedBox(width: 80,
                              child: Column(children: [
                                  CustomImage(height: 50, width: 50,
                                    image: '${Get.find<SplashController>().configModel?.baseUrls!.categoryImageUrl}/${categoryController.categoryList![index].image!}',
                                  ),
                                  SizedBox(height: 5,),
                                  Text(categoryController.categoryList![index].name!,
                                  style: robotoBold.copyWith(fontSize: Dimensions.fontSizeExtraSmall),),
                              ],
                              ),
                            ),
                          );
                          }):Container(),))

                  ],
                )
            ],
          );
        });
  }
}
