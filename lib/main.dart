import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'data/data.dart';
import 'res/res.dart';
import 'utils/utils.dart';

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DeviceConfig()).init();
  await HiveManager.initHive();
  await Future.wait([
    AppConfig.init(
      const EnvConfig(
        appTitle: AppConstants.appName,
        appFlavor: AppFlavor.dev,
      ),
    ),
  ]);
  Get.put<ApiWrapper>(ApiWrapper());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        child: GetMaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: ColorsValue.primaryColor,
            fontFamily: 'Poppins',
          ),
          translations: TranslationsFile(),
          getPages: AppPages.pages,
          initialRoute: AppPages.initial,
        ),
      );
}
