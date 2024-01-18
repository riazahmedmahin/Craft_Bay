import 'package:craft_bay/Data/models/network_caller.dart';
import 'package:craft_bay/Data/services/response.dart';
import 'package:craft_bay/Data/utility/urls.dart';
import 'package:get/get.dart';

class SendEmailOtpController extends GetxController{
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;


  Future<bool>sendOtpToEmail(String email) async{
    _inProgress=true;
    update();

    final ResponseData response = await network_caller().getRequest(Urls.sentEmailOtp(email));
    _inProgress=false;
    if(response.isSuccess){
      update();
      return true;
    }
    else{
      _errorMessage = response.errorMessage;
      update();
      return false;
    }

}

}