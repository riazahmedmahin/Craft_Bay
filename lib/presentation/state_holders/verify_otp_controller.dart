import 'package:craft_bay/Data/models/network_caller.dart';
import 'package:craft_bay/Data/utility/urls.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController{
  bool _inProgress = false;

  bool get inProgress =>_inProgress;

  String _errorMessage ="";

  String get errorMassage=>_errorMessage;

  Future<bool>VerityOtp(String email , String otp) async{
    _inProgress = true;
    update();
    final response =  await network_caller().getRequest(Urls.verifyOtp(email, otp));
    if(response.isSuccess){
      final token = response.responseData['data'];
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