import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sixamfoodapp/theme/light_theme.dart';
import 'package:sixamfoodapp/util/app_constants.dart';
import 'helper/get_di.dart' as di;
import 'package:sixamfoodapp/util/messages.dart';
import 'package:sixamfoodapp/view/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized

  Map<String, Map<String, String>> languages = await di.init();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;

  const MyApp({Key? key, required this.languages}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('en', 'US'),
      fallbackLocale: Locale(
          AppConstants.languages[0].languageCode!,
          AppConstants.languages[0].countryCode),
      translations: Messages(languages: widget.languages),
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: light,
      home: const HomeScreen(),
    );
  }
}
