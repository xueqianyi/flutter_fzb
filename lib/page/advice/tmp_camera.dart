import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tmp/provide/camera_provider.dart';
import 'package:flutter_tmp/utils/screen.dart';
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:provider/provider.dart';
import 'package:path/path.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CameraMain(),
    );
  }
}

// class CameraMain extends StatefulWidget {
//   @override
//   _CameraMainState createState() => _CameraMainState();
// }
//
// class _CameraMainState extends State<CameraMain> {
//
//   var cameras;
//   CameraController _controller;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initCamera();
//   }
//
//   Future<void> initCamera()async{
//     cameras = await availableCameras();
//     _controller = CameraController(cameras[0], ResolutionPreset.high);
//     _controller.initialize().then((_){
//       if(!mounted){
//         return;
//       }
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (_controller == null||_controller.value == null) {
//       return Container(
//         child: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }
//     return _controller.value.isInitialized?Stack(
//       children: [
//         CameraPreview(_controller),
//         //左上方关闭按钮
//         Positioned(
//           left: tmpSetWidth(80.0),
//           top: tmpSetWidth(80.0),
//           child: IconButton(
//             icon: Icon(
//               Icons.close,
//               color: Colors.white,
//               size: tmpSetWidth(50),
//             ),
//             onPressed: (){
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         //右上方切换
//         Positioned(
//           top: tmpSetWidth(80.0),
//           right:tmpSetWidth(80.0),
//           child: IconButton(
//             icon: Icon(Icons.camera_front,color: Colors.white,size: tmpSetWidth(50),),
//             onPressed: (){
//               print('切换镜头');
//                 _controller = CameraController(cameras[1], ResolutionPreset.high);
//                 _controller.initialize().then((_){
//                   if(!mounted){
//                     return;
//                   }
//                   setState(() {});
//                 });
//             },
//           ),
//         ),
//         //下方拍照按钮
//         Positioned(
//           left: tmpSetWidth(325.0),
//           bottom: tmpSetHeight(100.0),
//           child: InkWell(
//             onTap: (){
//               print('点击了拍照按钮');
//             },
//             child:Container(
//               width: tmpSetWidth(100),
//               height: tmpSetWidth(100),
//               decoration: BoxDecoration(
//                 color: Colors.transparent,
//                 borderRadius: BorderRadius.circular(90),
//                 border: Border.all(width: tmpSetWidth(10),color: Color.fromARGB(80, 219, 48, 85)),
//               ),
//               child: Container(
//                 width: tmpSetWidth(60),
//                 height: tmpSetHeight(60),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 219, 48, 85),
//                   borderRadius: BorderRadius.circular(75),
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//       ],
//     ):Container();
//   }
// }

class CameraMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CameraProvider provider = Provider.of<CameraProvider>(context);
    if (provider == null || provider.cameraController == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    CameraController _controller = provider.cameraController;
    if (_controller == null || _controller?.value == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return _controller.value.isInitialized
        ? Stack(
            children: [
              Transform.scale(
                scale: _controller.value.aspectRatio / deviceRatio,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: CameraPreview(_controller),
                  ),
                ),
              ),//图片拉伸效果

              //左上方关闭按钮
              Positioned(
                left: tmpSetWidth(80.0),
                top: tmpSetWidth(80.0),
                child: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: tmpSetWidth(50),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              //右上方切换
              Positioned(
                top: tmpSetWidth(80.0),
                right: tmpSetWidth(80.0),
                child: IconButton(
                  icon: Icon(
                    Icons.camera_front,
                    color: Colors.white,
                    size: tmpSetWidth(50),
                  ),
                  onPressed: () {
                    print('切换镜头');
                    provider.changeCamera();
                  },
                ),
              ),

              //下方拍照按钮(图片拍摄)
              Positioned(
                left: tmpSetWidth(325.0),
                bottom: tmpSetHeight(100.0),
                child: InkWell(
                  onTap: () async {
                    print('点击了拍照按钮');
                   // provider.cameraController.takePicture();
                    provider.changeFileName();
                   await  provider.cameraController.takePicture(provider.fileName).then((_){

                     //把相片存在相册
                     ImagePickerSaver.saveFile(fileData: File(provider.fileName).readAsBytesSync());
                     //删除系统文件夹下的图片
                     File(provider.fileName).deleteSync();


                   });
                  },
                  child: Container(
                    width: tmpSetWidth(100),
                    height: tmpSetWidth(100),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(90),
                      border: Border.all(
                          width: tmpSetWidth(10),
                          color: Color.fromARGB(80, 219, 48, 85)),
                    ),
                    child: Container(
                      width: tmpSetWidth(60),
                      height: tmpSetHeight(60),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 219, 48, 85),
                        borderRadius: BorderRadius.circular(75),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
