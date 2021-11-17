import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tmp/page/advice/advice_top_bar.dart';
import 'package:flutter_tmp/utils/screen.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


class AdvicePage extends StatefulWidget {
  @override
  _AdvicePageState createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/反馈背景页.png'),
              fit: BoxFit.cover,
            ),
          ),
          child:Column(
            children: [
              TopAppBarAdvice(),
              AdviceContent(),
            ],
          )
      ),
    );
  }
}

class AdviceContent extends StatefulWidget {
  @override
  _AdviceContentState createState() => _AdviceContentState();
}

class _AdviceContentState extends State<AdviceContent> {
  //文本输入
  TextEditingController _controller = TextEditingController();

  //上传图片用
  ScrollController _imgController = new ScrollController();
  List<Asset> _img = new List<Asset>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tmpSetWidth(714.0),
      height: tmpSetHeight(1172.0),
      margin: EdgeInsets.only(
        left: tmpSetWidth(18.0),
        right: tmpSetWidth(18.0),
        top: tmpSetHeight(10.0),
      ),
      decoration: BoxDecoration(
        color: Colors.white12,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
      ),
      child: Column(
        children: [
          //提交文字
          Container(
            margin: EdgeInsets.only(top: tmpSetHeight(40.0)),
            width: tmpSetWidth(680),
            height: tmpSetHeight(300),
            decoration: BoxDecoration(
              color: Colors.grey[50],
            ),
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.words,
              maxLines: 10,
              maxLength: 400,
              enabled: true,
              onSubmitted: (text) {
                print('submit $text');
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(tmpSetWidth(10.0)),
                hintText: '请输入...',
                border: InputBorder.none,
              ),
            ),
          ),
          //提交图片标语
          Container(
            margin: EdgeInsets.only(top: tmpSetHeight(30.0)),
            child: Row(
              children: [
                Container(
                  width: tmpSetWidth(5.0),
                  height: tmpSetHeight(30.0),
                  margin: EdgeInsets.only(left: tmpSetWidth(20.0)),
                  color: Colors.green,
                ),
                Container(
                  margin: EdgeInsets.only(left: tmpSetWidth(20.0)),
                  child: InkWell(
                    onTap: () {
                      print('');
                      //  Navigator.pushNamed(context,  '/camera');
                    },
                    child: Text(
                      '图片上传',
                      style: TextStyle(
                        fontSize: tmpSetFontSize(30),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //提交图片按钮
          Container(
            margin: EdgeInsets.only(top: tmpSetHeight(15.0)),
            child: Row(
              children: [
                Container(
                  height: tmpSetWidth(120.0),
                  width: tmpSetWidth(120.0),
                  margin: EdgeInsets.only(left: tmpSetWidth(20.0)),
                  color: Colors.black12,
                  child: IconButton(
                    onPressed: () {
                      print('点击了相机');
                      _bottomReminder();
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey,
                      size: tmpSetWidth(70),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Wrap(
              spacing: 3,
              runSpacing: 3,
              children: _manyWrap(),
            ),
          ),
          Spacer(),
          //提交按钮
          Container(
            margin: EdgeInsets.only(bottom: tmpSetHeight(40.0)),
            alignment: AlignmentDirectional.center,
            child: ButtonTheme(
              minWidth: tmpSetWidth(320),
              height: tmpSetHeight(66.0),
              child: RaisedButton(
                onPressed: () {
                  print('点击了提交按钮');
                },
                child: Text(
                  '提交',
                  style: TextStyle(
                    fontSize: tmpSetFontSize(32.0),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                textColor: Colors.white,
                color: Colors.greenAccent[400],
                shape: StadiumBorder(),
                elevation: 5,
                highlightColor: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _singlePhoto(int index){
    return Container(
      height: tmpSetWidth(120.0),
      width: tmpSetWidth(120.0),
      margin: EdgeInsets.only(left: tmpSetWidth(20.0)),
      color: Colors.black12,
      child:AssetThumb(
        asset: this._img[index],
         width: 50,
         height: 50,
      ),
    );
  }

  List<Widget> _manyWrap(){
    List<Widget> listWidget = [];
    int length = _img.length;
    for(int i = 0;i<length;i++){
      listWidget.add(_singlePhoto(i));
    }
    return listWidget;
  }

  //选择文件上传
  void _openGallerySystem () async {
    List<Asset> resultList = List<Asset>();
    resultList = await MultiImagePicker.pickImages(
      //最多选择几张照片
      maxImages: 9,
      //是否可以拍照
      enableCamera: false,
      selectedAssets: _img,
      materialOptions:MaterialOptions(
          startInAllView:true,
          allViewTitle:'所有照片',
          actionBarColor:'#2196F3',
          //未选择图片时提示
          textOnNothingSelected:'没有选择照片',
          //选择图片超过限制弹出提示
          selectionLimitReachedText: "最多选择9张照片"
      ),
    );
    if (!mounted) return;
    setState(() {
      _img = resultList;
    });
  }

  //底部弹窗
  void _bottomReminder(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder) {
          return Container(
            height: tmpSetHeight(300),
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0))),
            child: Container(
              child: Column(
                children: [
                  Container(
                    width: tmpSetWidth(750),
                    height: tmpSetHeight(100),
                    child: FlatButton(

                      child: Text('拍摄',style: TextStyle(
                        // color: Colors.green,
                        fontSize: tmpSetFontSize(35),
                      ),),
                      onPressed: () {
                          Navigator.pushNamed(context,  '/camera');
                      },
                    ),
                  ),
                  Container(
                    width: tmpSetWidth(750),
                    height: tmpSetHeight(100),
                    child: FlatButton(
                      child: Text('从相机中选择',style: TextStyle(
                        // color: Colors.green,
                        fontSize: tmpSetFontSize(35),
                      ),),
                      onPressed: () {
                        _openGallerySystem();
                      },
                    ),
                  ),
                  Container(
                    width: tmpSetWidth(750),
                    height: tmpSetHeight(100),
                    child: FlatButton(
                      child: Text('取消',style: TextStyle(
                        // color: Colors.green,
                        fontSize: tmpSetFontSize(35),
                      ),),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
