import 'package:flutter/material.dart';
import 'package:flutter_tmp/model/video_content.dart';
import 'package:flutter_tmp/utils/screen.dart';

class VideoDesCol extends StatefulWidget {
  // final List videoContentList;
  final VideoContentItem videoContentItem;

  // VideoDesCol(this.videoContentList, {Key key}) : super(key: key);
  VideoDesCol(this.videoContentItem, {Key key}) : super(key: key);

  _VideoDesColState createState() => _VideoDesColState();
}

class _VideoDesColState extends State<VideoDesCol>
    with AutomaticKeepAliveClientMixin {
  VideoContentItem videoContent;

  //  ProductContentitem videoContent;
  bool get wantKeepAlive => true;

  var actionEventBus;

  // var cartProvider;

  @override
  void initState() {
    super.initState();
    // this.videoContent = widget.videoContentList[0];
    this.videoContent = widget.videoContentItem;
  }

  @override
  Widget build(BuildContext context) {
    // this.cartProvider = Provider.of<Cart>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text("简介",
                style: TextStyle(
                    color: Colors.black87, fontSize: tmpSetFontSize(35))),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "   滑坡和崩塌如同孪生姐妹，甚至有着无法分割的联系。它们常常相伴而生，产生于相同的地质构造环境中和相同的地层岩性构造条件下，且有着相同的触发因素，容易产生滑坡的地带也是崩塌的易发区。例如宝成铁路宝鸡至绵阳段，即是滑坡和崩塌多发区。崩塌可转化为滑坡：一个地方长期不断地发生崩塌，其积累的大量崩塌堆积体在一定条件下可生成滑坡；有时崩塌在运动过程中直接转化为滑坡运动，且这种转化是比较常见。有时岩土体的重力运动形式介于崩塌式运动和滑坡式运动之间，以至人们无法区别此运动是崩塌还是滑坡。因此地质科学工作者称此为滑坡式崩塌，或崩塌型滑坡、崩塌、滑坡在一定条件下可互相诱发、互相转化：崩塌体击落在老滑坡体或松散不稳定堆积体上部，在崩塌的重力冲击下，有时可使老滑坡复活或产生新滑坡。滑坡在向下滑动过程中若地形突然变陡，滑体就会由滑动转为坠落，即滑坡转化为崩塌。有时，由于滑坡后缘产生了许多裂缝，因而滑坡发生后其高陡的后壁会不断的发生崩塌。另外，滑坡和崩塌也有着相同的次生灾害和相似的发生前兆。",
              style: TextStyle(
                color: Colors.black54,
                fontSize: tmpSetFontSize(35),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
