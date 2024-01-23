import 'package:craft_bay/Data/models/network_caller.dart';
import 'package:craft_bay/presentation/state_holders/auth_controller.dart';
import 'package:craft_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:get/get.dart';

import '../../Data/utility/urls.dart';

class VerifyOTPController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String _token = '';

  String get token => _token;

  Future<bool> verifyOTP(String email, String otp) async {
    _inProgress = true;
    update();
    final response = await network_caller().getRequest(Urls.verifyOtp(email, otp));
    _inProgress = false;
    if (response.isSuccess) {
      _token = response.responseData['data'];
      await Future.delayed(const Duration(seconds: 5));
      final result =
      await Get.find<ReadProfileController>().readProfileData(token);
      if (result) {
        _shouldNavigateCompleteProfile = Get.find<ReadProfileController>().isProfileComplete == false;
        if (_shouldNavigateCompleteProfile == false) {
          await Get.find<AuthController>().saveUserDetails(token, Get.find<ReadProfileController>().profile);
        }
      } else {
        _errorMessage = Get.find<ReadProfileController>().errorMassage;
        update();
        return false;
      }
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}