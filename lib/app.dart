import 'package:craft_bay/presentation/ui/screens/auth/splash_screen.dart';
import 'package:craft_bay/presentation/ui/utility/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CratfyBay extends StatelessWidget {
  const CratfyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: AppThemeData.lightThemeData,
      debugShowCheckedModeBanner: false,
      home:Splash_Screen(),
    );
  }
}
