import 'package:flutter/material.dart';
import 'package:flutter_tmp/page/report_event/title_widget.dart';
import 'package:flutter_tmp/page/report_event/topAppBarReport.dart';
import 'package:flutter_tmp/utils/utils.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_plugin_record/widgets/voice_widget.dart';
import 'package:flutter_plugin_record/flutter_plugin_record.dart';
import 'package:flutter_tmp/provide/report_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReportEvent extends StatefulWidget {
  @override
  _ReportEventState createState() => _ReportEventState();
}

class _ReportEventState extends State<ReportEvent> {
  @override
  Widget build(BuildContext context) {
    ReportProvider provider = Provider.of<ReportProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/signbackground.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: ListView(
          children: [
            //顶部AppBar
            TopAppBarReport(),
            //事件类型选择
            IncidentSelected(),
            //事件描述
            IncidentDescrible(),
            //上传图片
            ImageLoad(),
            //上传录音
            VoiceRecode(),
            //提交按钮
            submitButton(),
          ],
        ),
      ),
    );
  }
}

//事件类型选择
class IncidentSelected extends StatefulWidget {
  @override
  _IncidentSelectedState createState() => _IncidentSelectedState();
}

class _IncidentSelectedState extends State<IncidentSelected> {
  String _radioCheck = '泥石流';
  List<String> _radioList = List<String>();

  @override
  void initState() {
    super.initState();
    _radioList.add("泥石流");
    _radioList.add("火灾");
    _radioList.add("洪灾");
  }

  @override
  Widget build(BuildContext context) {
    ReportProvider provider = Provider.of<ReportProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: tmpSetHeight(60.0),
            padding: EdgeInsets.only(
                left: tmpSetWidth(15.0), top: tmpSetHeight(15.0)),
            child: titleWidget('事件类型选择'),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: _radioList.length,
              padding: EdgeInsets.all(5.0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // color: Colors.yellow,
                  height: tmpSetHeight(80.0),
                  // alignment: Alignment.center,
                  child: ListTile(
                    leading: Radio(
                      value: _radioList[index],
                      groupValue: provider.selectOption,
                      onChanged: (String value) {
                        setState(() {
                          provider.setOption(value);
                        });
                      },
                    ),
                    title: Container(
                      padding: EdgeInsets.only(top: 0.0),
                      child: Text(_radioList[index]),),
                    contentPadding: EdgeInsets.all(5.0),
                    onTap: () {
                      setState(() {
                        _radioCheck = _radioList[index];
                        provider.setOption(_radioList[index]);
                      });
                    },
                  ),
                );
              }),
        ],
      ),
    );
  }
}


//事件描述
class IncidentDescrible extends StatefulWidget {
  @override
  _IncidentDescribleState createState() => _IncidentDescribleState();
}

class _IncidentDescribleState extends State<IncidentDescrible> {
  String description = '';
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ReportProvider provider = Provider.of<ReportProvider>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: tmpSetHeight(60.0),
            padding: EdgeInsets.only(
                left: tmpSetWidth(15.0), top: tmpSetHeight(15.0)),
            child: titleWidget('事件描述'),
          ),
          Container(
            height: tmpSetHeight(200.0),
            padding: EdgeInsets.all(tmpSetWidth(10.0)),
            child: Container(
              child: TextField(
                maxLines: 10,
                minLines: 5,
                maxLength: 400,
                decoration: new InputDecoration(
                  fillColor: Colors.grey[300],
                  labelText: '请输入事件描述',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  //  this.description=value;
                  provider.setDescription(value);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//图片上传
class ImageLoad extends StatefulWidget {
  @override
  _ImageLoadState createState() => _ImageLoadState();
}

class _ImageLoadState extends State<ImageLoad> {
  //上传图片用
  ScrollController _imgController = new ScrollController();
  List<Asset> _img = new List<Asset>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: tmpSetHeight(60.0),
            padding: EdgeInsets.only(
                left: tmpSetWidth(15.0), top: tmpSetHeight(15.0)),
            child: titleWidget('图片上传'),
          ),
          Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      this._img == null ? Expanded(
                        flex: 1,
                        child: Text(""),
                      ) : Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: ListView.builder(
                            controller: _imgController,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: this._img.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 50,
                                height: 50,
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      style: BorderStyle.solid,
                                      color: Colors.black26,
                                    )
                                ),
                                child: AssetThumb(
                                  asset: this._img[index],
                                  width: 50,
                                  height: 50,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      InkWell(
                        child: Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.only(right: tmpSetWidth(10.0)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.black26,
                              )
                          ),
                          child: Center(
                            child: Icon(Icons.camera_alt),
                          ),
                        ),
                        onTap: _openGallerySystem,
                      )
                    ],
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }

  //选择文件上传
  void _openGallerySystem() async {
    List<Asset> resultList = List<Asset>();
    resultList = await MultiImagePicker.pickImages(
      //最多选择几张照片
      maxImages: 9,
      //是否可以拍照
      enableCamera: true,
      selectedAssets: _img,
      materialOptions: MaterialOptions(
          startInAllView: true,
          allViewTitle: '所有照片',
          actionBarColor: '#2196F3',
          //未选择图片时提示
          textOnNothingSelected: '没有选择照片',
          //选择图片超过限制弹出提示
          selectionLimitReachedText: "最多选择9张照片"
      ),
    );
    if (!mounted) return;
    setState(() {
      _img = resultList;
    });
  }
}

//录音上传
class VoiceRecode extends StatefulWidget {
  @override
  _VoiceRecodeState createState() => _VoiceRecodeState();
}

class _VoiceRecodeState extends State<VoiceRecode> {

  bool recorded = false;
  String audioPath = '';
  FlutterPluginRecord recordPlugin = new FlutterPluginRecord();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: tmpSetHeight(60.0),
            padding: EdgeInsets.only(
                left: tmpSetWidth(15.0), top: tmpSetHeight(15.0)),
            child: titleWidget('录音上传'),
          ),
          Container(
            padding: EdgeInsets.only(top: tmpSetHeight(10.0)),
            child: VoiceWidget(
              startRecord: startRecord,
              stopRecord: stopRecord,
              // 加入定制化Container的相关属性
              height: 40.0,
            ),
          ),
          recorded == true ? Container(
            child: FlatButton(
              child: Icon(Icons.mic, color: Colors.green,),
              onPressed: () {
                recordPlugin.play();
              },
            ),
          ) : SizedBox(height: tmpSetHeight(20.0)),

        ],

      ),
    );
  }

  startRecord() {
    print("开始录制");
  }

  stopRecord(String path, double audioTimeLength) {
    print("结束束录制");
    print("音频文件位置" + path);
    print("音频录制时长" + audioTimeLength.toString());
    audioPath = path;
    setState(() {
      recorded = true;
    });
  }
}

//提交按钮+api
class submitButton extends StatelessWidget {
  postIssue(String radioCheck,String description ) async {
    if (radioCheck == "") {
      Fluttertoast.showToast(
        msg: '描述不能为空',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return;
    }

    // var apiInfo = '${Config.domain}${Config.postingIssueInfo}';
    // var apiPic = '${Config.domain}${Config.postingIssuePic}';
    // var apiAudio = '${Config.domain}${Config.postingIssueAudio}';
    //
    // var response1 = await Dio().post(apiInfo,
    //     data: {"issueType": this._radioCheck, "issueDes": this.description,});
    //
    // if (response1.data["err"] == 0) {
    //   print(response1.data);
    //   //保存用户信息
    //   Fluttertoast.showToast(
    //     msg: '上传成功',
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //   );
    // } else {
    //   print(response1.data["msg"]);
    //   Fluttertoast.showToast(
    //     msg: '上传失败',
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //   );
    // }
  }
  @override
  Widget build(BuildContext context) {
    ReportProvider provider = Provider.of<ReportProvider>(context);
    return Container(
      child: InkWell(
        onTap: (){
          postIssue(provider.selectOption,provider.reportDescription);
        },
        child: Container(
          margin: EdgeInsets.all(tmpSetWidth(15.0)),
          height: tmpSetHeight(60.0),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              "提 交",
              style: TextStyle(fontSize:tmpSetFontSize(30.0),color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}


