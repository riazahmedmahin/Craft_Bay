import 'package:craft_bay/presentation/ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CratfyBay extends StatelessWidget {
  const CratfyBay({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splash_Screen(),
    );
  }
}
