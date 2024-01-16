import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sixamfoodapp/theme/light_theme.dart';
import 'package:sixamfoodapp/util/messages.dart';
import 'package:sixamfoodapp/view/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      translations: Languages(),
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: light,
      home: const HomeScreen(),
    );
  }
}

