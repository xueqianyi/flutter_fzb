import 'package:flutter/material.dart';

class HomePageProvide with ChangeNotifier{
  bool isLeft = true;
  bool isMiddle = false;
  bool isRight = false;

  //切换方法
  changeTabBar(String changeState){
    if(changeState == 'left'){
      isLeft = true;
      isMiddle = false;
      isRight = false;
    }else if(changeState == 'middle'){
      isLeft = false;
      isMiddle = true;
      isRight = false;
    }else if(changeState == 'right'){
      isLeft = false;
      isMiddle = false;
      isRight = true;
    }
    notifyListeners();
  }
}