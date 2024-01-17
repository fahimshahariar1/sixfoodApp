
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sixamfoodapp/controller/category_controller.dart';
import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/util/styles.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (categoryController) {
          return (categoryController.categoryList != null && categoryController.categoryList!.isEmpty) ?
          const SizedBox() : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("category".tr, style: robotoBold.copyWith(fontSize: Dimensions.fontSizeDefault,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    Text(
                      "view".tr,
                      style: poppinsSemiBold.copyWith(fontSize: Dimensions.fontSizeSmall,
                        decoration: TextDecoration.underline, color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          );
        });
  }
}
