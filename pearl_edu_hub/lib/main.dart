import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pearl_edu_hub/helpers/box_helper.dart';
import 'package:pearl_edu_hub/pages/dashboard/dashboard_page.dart';
import 'package:pearl_edu_hub/pages/home_page.dart';
import 'package:pearl_edu_hub/rescources/fonts.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:pearl_edu_hub/route/navi.dart';

void main() async {
  // usePathUrlStrategy();
  await Hive.initFlutter();
  await BoxHelper().openBoxes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pearl Edu Hub',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: kFontTWK,
      ),
      home: const HomePage(),
      initialRoute: Navi.initialRoute,
      getPages: [
        GetPage(
          name: Navi.initialRoute,
          page: () => const HomePage(),
        ),
        GetPage(
          name: Navi.getDashboard,
          page: () => const DashboardPage(),
          transitionDuration: const Duration(seconds: 3),
        ),
      ],
    );
  }
}
