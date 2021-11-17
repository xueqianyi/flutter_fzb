import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart'as p;
import 'package:uuid/uuid.dart';

class CameraProvider with ChangeNotifier{
  CameraController cameraController;
  List<CameraDescription> cameras;
  int curCamera = 0;
  String appFolder = '';
  String fileName;

  CameraProvider(){
    getCameras();
  }

  changeFileName(){
    String id = Uuid().v4().toString();
    fileName = p.join(appFolder,'$id.png}');
    notifyListeners();
  }

  getCameras()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    appFolder = appDocDir.path;
    cameras = await availableCameras();
    cameraController = CameraController(cameras[curCamera], ResolutionPreset.high);
    cameraController.initialize().then((value){
      notifyListeners();
    });
  }


  //切换摄像头
  changeCamera(){
    if(curCamera == 0){
      curCamera = 1;
    }else{
      curCamera = 0;
    }
    cameraController = CameraController(cameras[curCamera], ResolutionPreset.high);
    cameraController.initialize().then((_){
      notifyListeners();
    });
  }


}