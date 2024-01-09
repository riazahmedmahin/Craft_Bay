import 'package:get/get.dart';

class MainBottomNabController extends GetxController{
  int _selectedIndex=0;

  int get CurrentIndex => _selectedIndex;

  void ChangeIndex (int index){
    if(_selectedIndex==index){
      return;
    }
    _selectedIndex=index;
    update();
  }
  void BackToHome(){
    ChangeIndex(0);
  }
}