import 'package:flutter/material.dart';

class ReportProvider with ChangeNotifier{
  String selectOption = '泥石流';
  String reportDescription = '';

  setOption(String option){
    selectOption = option;
    notifyListeners();
  }
  setDescription(String des){
    reportDescription = des;
    notifyListeners();
  }
}