import 'package:flutter/material.dart';
import 'package:flutter_tmp/model/video_content.dart';

class MindMapCol extends StatefulWidget {
  // final List _videoContentList;
  final VideoContentItem videoContentItem;
  MindMapCol(this.videoContentItem, {Key key}) : super(key: key);

  _MindMapColState createState() => _MindMapColState();
}

class _MindMapColState extends State<MindMapCol>
    with AutomaticKeepAliveClientMixin {
  // VideoContentItem _videoContent;
  // ProductContentitem _videoContent;
  VideoContentItem videoContent;
  bool get wantKeepAlive => true;
  String domain="http://172.20.10.5:3000/";
  @override
  void initState() {
    super.initState();
    // this._videoContent = widget._videoContentList[0];
    this.videoContent=widget.videoContentItem;
  }
  @override
  Widget build(BuildContext context) {

    //处理图片
    // String pic = Config.domain + this._videoContent.videoPic;
    // String pic= domain+this.videoContent.videoPic;
    //
    // if(pic.isEmpty){
    //   return Text("思维导图加载失败");
    // }
    // pic = pic.replaceAll('\\', '/');

    return Container(
      padding: EdgeInsets.all(10),

      child: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 16 / 12,
            child: Image.network("https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdoc.100lw.com%2Fpic%2F2aa6f2ec8d30208698b97e1599e86730e17cb838%2F1-674-png_6_0_0_65_253_762_331_892.979_1262.879-1550-0-527-1550.jpg&refer=http%3A%2F%2Fdoc.100lw.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1621012290&t=9235c810b4923f8c07f45e34eddfa78b", fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
