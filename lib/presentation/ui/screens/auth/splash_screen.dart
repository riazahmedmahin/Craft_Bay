import 'package:craft_bay/presentation/state_holders/auth_controller.dart';
import 'package:craft_bay/presentation/ui/screens/auth/verity_email_screen.dart';
import 'package:craft_bay/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:craft_bay/presentation/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    super.initState();
    moveToNextScreen();
  }


  void moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 1),);
    final bool isLoggedIn = await Get.find<AuthController>().isLoggedIn();
    if (isLoggedIn) {
      Get.offAll(const MainBottomNavScreen());
    } else {
      Get.offAll(const VerifyEmailScreen());
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16,),
            Text('Version 1.0'),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
