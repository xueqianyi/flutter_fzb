import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_tmp/model/activity_model.dart';
import 'package:flutter_tmp/model/enroll_model.dart';
import 'package:flutter_tmp/model/home_model.dart';

const config = 'http://192.168.1.100:3000';

class API {
  //首页数据接口
  static Future<HomePageModel> getHomesPage() async {
    try {
      var response = await Dio().get(
        '$config/homepage',
        options: Options(responseType: ResponseType.plain),
      );
      // print(response);
      Map<String, dynamic> res = jsonDecode(response.toString());
      return HomePageModel.fromJson(res);
    } catch (e) {
      print(e);
    }
  }
  //活动数据接口
  static Future<List<ActivityModel>> getActivityPage() async {
    try {
      var response = await Dio().get(
        '$config/homepage/activity',
        options: Options(responseType: ResponseType.plain),
      );
      var res = jsonDecode(response.toString());
      List<ActivityModel> list = res
          .map<ActivityModel>((value) => ActivityModel.fromJson(value))
          .toList();
      return list;
    } catch (e) {
      print(e);
    }
  }
  //活动详情页接口
  static Future<ActivityModel> findActivity(String activityId) async {
    try {
      var response = await Dio().get(
        '$config/homepage/activity/GetActivityById',
        queryParameters: {'activity_id': activityId},
        options: Options(responseType: ResponseType.plain),
      );
      //  print(response);
      Map<String, dynamic> res = jsonDecode(response.toString());
      if (res['msg'].length >= 1) {
        return ActivityModel.fromJson(res['msg'][0]);
      } else
        return ActivityModel.fromJson(res['msg']);
    } catch (e) {
      print(e);
    }
  }
  //报名接口
  static Future<EnrollModel> enrollActivity(String activity_name,String user)async{
    try{
      var response = await Dio().get(
        '$config/homepage/activity/participant',
        queryParameters: {'activity_name':activity_name,'user':user},
        options: Options(responseType: ResponseType.plain),
      );
      Map<String, dynamic> res = jsonDecode(response.toString());
      return EnrollModel.fromJson(res);
    }catch(e){
      print(e);
    }
  }
  //事件上报接口
  static Future<void> submitIncident(String option,String des )async{
    try{

    }catch(e){
      print(e);
    }
  }
}
