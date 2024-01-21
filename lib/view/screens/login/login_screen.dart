import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sixamfoodapp/controller/auth_controller.dart';
import 'package:sixamfoodapp/controller/user_controller.dart';
import 'package:sixamfoodapp/data/api/api_client.dart';
import 'package:sixamfoodapp/util/app_constants.dart';
import 'package:sixamfoodapp/util/dimensions.dart';
import 'package:sixamfoodapp/util/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  File? image;
  final ApiClient apiClient = Get.find<ApiClient>();

  @override
  void initState() {
    super.initState();
    initCall();
  }

  void initCall() {

    if(Get.find<AuthController>().isLoggedIn() && Get.find<UserController>().userInfoModel == null) {
      Get.find<UserController>().getUserInfo();
    }
    Get.find<UserController>().initData();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text("login".tr, style: poppinsBold,),
      ),
      body: Container(
        padding: EdgeInsets.only(top: Dimensions.paddingSizeDefault),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: firstName,
                  style: poppinsMedium.copyWith(),
                  decoration: InputDecoration(
                    labelText: "first_name".tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeLarge)),
                    contentPadding: EdgeInsets.all(20),
                    prefixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                    isCollapsed: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault,),

            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: lastName,
                  style: poppinsMedium.copyWith(),
                  decoration: InputDecoration(
                    labelText: "last_name".tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeLarge)),
                    contentPadding: EdgeInsets.all(20),
                    prefixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                    isCollapsed: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault,),

            Center(
              child: SizedBox(
                width: 350,
                child: TextField(
                  controller: email,
                  style: poppinsMedium.copyWith(),
                  decoration: InputDecoration(
                    labelText: "email".tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimensions.paddingSizeLarge)),
                    contentPadding: EdgeInsets.all(20),
                    prefixIcon: Icon(Icons.drive_file_rename_outline_rounded),
                    isCollapsed: true,
                  ),
                ),
              ),
            ),
            const SizedBox(height: Dimensions.paddingSizeDefault,),



            const SizedBox(height: Dimensions.paddingSizeDefault,),

            ElevatedButton(
              onPressed: () async {
                try {
                  final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (pickedImage == null) return;
                  final imageTemp = File(pickedImage.path);
                  setState(() => image = imageTemp);
                } on PlatformException catch (e) {
                  if (kDebugMode) {
                    print('Failed to pick image: $e');
                  }
                }
              },
              child: Text("select_image".tr),
            ),

            const SizedBox(height: Dimensions.paddingSizeDefault,),

            SizedBox(
              height: Dimensions.paddingSizeOver,
              width: Dimensions.paddingSizeOver,
              child: image != null
                  ? ClipOval(
                child: Image.file(image!, fit: BoxFit.cover),
              )
                  : Container(),
            ),


            const SizedBox(height: Dimensions.paddingSizeDefault,),

            ElevatedButton(
              onPressed: () async {

              },
              child: Text("save".tr),
            ),
          ],
        ),
      ),
    );
  }
}
