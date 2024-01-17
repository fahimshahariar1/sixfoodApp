import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



class ApiChecker {
  static void checkApi(Response response){
    if (response.statusCode == 401){
      return;
    }
  }
}