import 'package:craft_bay/Data/models/network_caller.dart';
import 'package:craft_bay/Data/utility/urls.dart';
import 'package:craft_bay/presentation/state_holders/read_profile_controller.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController{
  bool _inProgress = false;

  bool get inProgress =>_inProgress;

  String _errorMessage ="";

  String get errorMassage=>_errorMessage;

  bool _shouldNavigateCompleteProfile = true;

  bool get shouldNavigateCompleteProfile => _shouldNavigateCompleteProfile;

  String _token = '';

  String get token => _token;


  Future<bool>verifyOtp(String email , String otp) async{
    _inProgress = true;
    update();
    final response =  await network_caller().getRequest(Urls.verifyOtp(email, otp));
    if(response.isSuccess){
      final token = response.responseData['data'];
      await Future.delayed(Duration(seconds: 3));
      final result = await Get.find<ReadProfileController>().readProfileData(token);
      if(result){
        _shouldNavigateCompleteProfile= await Get.find<ReadProfileController>().isProfileComplete==false;
        if(_shouldNavigateCompleteProfile==false){
          //await Get.find<AuthController>().saveUserDetails(token, Get.find<ReadProfileController>().profile);
        }
        else {
          _errorMessage = Get.find<ReadProfileController>().errorMassage;
          update();
          return false;
        }
      }
      update();
      return true;

    }
    else{
      _errorMessage=response.errorMessage;
      update();
      return false;

    }
  }

}