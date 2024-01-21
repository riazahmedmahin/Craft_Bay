import 'package:craft_bay/Data/models/network_caller.dart';
import 'package:craft_bay/Data/models/profile.dart';
import 'package:craft_bay/Data/utility/urls.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController{
  bool _inProgress = false;

  bool get inProgress =>_inProgress;

  String _errorMessage ="";

  String get errorMassage=>_errorMessage;

  Profile _profile = Profile();

  Profile get profile=>_profile;

  bool _isProfileCompleted=false;

  bool get isProfileComplete=> _isProfileCompleted;

  Future<bool>readProfileData(String token) async{
    _inProgress = true;
    update();
    final response =  await network_caller().getRequest(Urls.readProfile,token: token);
    if(response.isSuccess){
      final ProfileData = response.responseData['data'];
      if(ProfileData.isEmply){
        _isProfileCompleted=false;
      }
      else{
        _profile=Profile.fromJson(ProfileData[0]);
        _isProfileCompleted=true;
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