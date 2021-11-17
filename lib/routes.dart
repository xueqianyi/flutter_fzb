import 'package:flutter_tmp/navigator/tab_navigator.dart';
import 'package:flutter_tmp/page/advice/advice.dart';
import 'package:flutter_tmp/page/advice/tmp_camera.dart';
import 'package:flutter_tmp/page/community_campaign/community_activity.dart';
import 'package:flutter_tmp/page/help_telephone/help_telephone.dart';
import 'page/community_campaign/activity_detail/activity_detail.dart';
import 'package:flutter_tmp/page/video_content/video_content.dart';

var staticRoutes = {
  '/total-tab':(context) => TmpBottomNavigator(),//主页
  '/community-activity':(context) => ComunnityActivity(),//社区活动页
  '/activity-details':(context){return ActivityDetailPage(activityId: null,);},//社区活动详细页
  '/advice':(context) => AdvicePage(), //意见反馈页
  '/camera':(context) => CameraPage(),//拍照页面
  '/video':(context){return VideoLearningPage(videoId: null,);},//视频页面
  '/help-telephone':(context)=>HelpTelPage(), //便民服务页
};