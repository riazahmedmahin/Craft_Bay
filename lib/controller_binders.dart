import 'package:craft_bay/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:craft_bay/presentation/state_holders/send_email_otp_controller.dart';
import 'package:get/get.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNabController());
    Get.put(SendEmailOtpController());
  }
}