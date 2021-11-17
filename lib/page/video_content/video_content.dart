import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_plus/video_player_plus.dart';
import 'package:flutter_tmp/model/video_content.dart';
import 'package:flutter_tmp/utils/screen.dart';
import 'mind_map.dart';
import 'loadingWidget.dart';
import 'video_des.dart';

class VideoLearningPage extends StatefulWidget {
  final String videoId;
  VideoLearningPage({Key key, this.videoId}) : super(key: key);

  _VideoLearningPageState createState() => _VideoLearningPageState();
}

class _VideoLearningPageState extends State<VideoLearningPage> {
  VideoContentItem _videoContentItem;
  String title="";
  @override
  void initState() {
    super.initState();
    this._getContentData();
  }
  _getContentData() async {
    //api=域名+视频播放页面路径名+视频编号
    // var api = '${Config.domain}${Config.videoPage}${widget.arguments['id']}';
    // print(api);
    // var result = await Dio().get(api);
    // var videoContent = new VideoContentModel.fromJson(result.data);
    // setState(() {
    //   _videoContentItem=videoContent.result;
    //   this.title=this._videoContentItem.videoTitle;
    // });
  }
  //模拟视频URL
  String videoUrl = 'https://vd3.bdstatic.com/mda-kkn2g32annwec526/mda-kkn2g32annwec526.mp4?v_from_s=tc_haokan_4469&auth_key=1618420891-0-0-c654aef48f281cb4b634d950edb77a1d&bcevod_channel=searchbox_feed&pd=1&pt=3&abtest=3000165_2';
      @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length:2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width:tmpSetWidth(400.0),
                  child:Center(child: Text("近期极端天气灾害视频集锦",style: TextStyle(color: Colors.black),),)
              )
            ],
          ),
        ),
        // body:
         body:Column(
          children: <Widget>[
            Container(
              child:VideoPlayerPlus(
                VideoPlayerController.network(videoUrl),),
            ),
            TabBar(
              indicatorColor: Colors.red,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: <Widget>[
                Tab(
                  child: Text('学习简介', style: TextStyle(color: Colors.black,fontSize: tmpSetFontSize(32.0)),),
                ),
                Tab(
                  child: Text('知识图谱',style: TextStyle(color: Colors.black,fontSize: tmpSetFontSize(32.0)),),
                ),
              ],
            ),
            Expanded(
              flex:1,
              child:
              TabBarView(
                physics: NeverScrollableScrollPhysics(), //禁止TabBarView滑动
                children: <Widget>[
                  // VideoDesCol(this._videoContentList),
                  // MindMapCol(this._videoContentList),
                  VideoDesCol(this._videoContentItem),
                  MindMapCol(this._videoContentItem),
                ],
              ),
            ),
          ],
        )
           // : LoadingWidget(),
      ),
    );
  }
}

