import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tmp/api/api.dart';
import 'package:flutter_tmp/model/home_model.dart';
import 'package:flutter_tmp/page/home/middle_tab_bar.dart';
import 'package:flutter_tmp/page/home/topAppBar.dart';
import 'package:flutter_tmp/page/home/top_nav.dart';
import 'package:flutter_tmp/page/home/top_swiper.dart';
import 'package:flutter_tmp/provide/home_provide.dart';
import 'package:flutter_tmp/utils/screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tmp/page/video_content/video_content.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //首页轮播组件数据：
  List<String> bannerList = [];

  List tmpBannerList = [
    'assets/images/swiper1.png',
    'assets/images/swiper2.png',
    'assets/images/swiper3.png',
  ];

  //首页顶部按钮数据
  List topNavList = [];

  List tmpTopNavList = [
    'assets/images/社区活动.png',
    'assets/images/意见反馈.png',
    'assets/images/便民服务.png',
    'assets/images/调度中心.png',
  ];
  HomePageModel homeModel;
  List<Carousel> topList;
  List<Carousel> navButtonList;
  List<New> fireNews;
  List<New> floodNews;
  List<New> mudslideNews;

  _loadData() async {
    print('开始读入首页数据');
    homeModel = await API.getHomesPage();
    //print(topNavList);
    // News news = homeModel.news;
    // fireNews = news.fireNews;
    // floodNews = news.floodNews;
    // mudslideNews = news.mudslideNews;

    topList = homeModel.carousel;
    for (var i = 0; i < topList.length; i++) {
      bannerList.add(topList[i].img);
    }
    navButtonList = homeModel.icons;
    for (var i = 0; i < navButtonList.length; i++) {
      topNavList.add(navButtonList[i].img);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/signbackground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopAppBar(),
              TopBanner(
                bannerList: tmpBannerList,
              ),
              TopNavButton(
                topNavButton: tmpTopNavList,
                context: context,
              ),
              HomeTabBar(),
              WrapNews(),
            ],
          ),
        ),
      ),
    );
  }
}

class WrapNews extends StatefulWidget {
  final fireNews;
  final floodNews;
  final mudslideNews;

  WrapNews({Key key, this.fireNews, this.floodNews, this.mudslideNews})
      : super(key: key);

  @override
  _WrapNewsState createState() => _WrapNewsState();
}

class _WrapNewsState extends State<WrapNews> {
  bool isLeft;
  bool isRight;
  bool isMiddle;
  List<Widget> listWidget = [];

  @override
  Widget build(BuildContext context) {
    HomePageProvide provider = Provider.of<HomePageProvide>(context);
    isLeft = provider.isLeft;
    isRight = provider.isRight;
    isMiddle = provider.isMiddle;
    return Container(
      padding: EdgeInsets.only(top: tmpSetHeight(10.0)),
      height: tmpSetHeight(960.0),
      // child: ListView(
      //   shrinkWrap: true,
      //   physics: NeverScrollableScrollPhysics(),
      //   children:[
      //     _wrapList(),
      //   ],
      // ),
      child: Column(
        children: [_wrapList()],
      ),
    );
  }

  Widget _wrapList() {
    List<Widget> tmpListWidget = [];
    for (int i = 0; i < 6; i++) {
      tmpListWidget.add(_singleNews(
          'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2736839628,3091279927&fm=26&gp=0.jpg',
          '四川阿坝州暴雨泥石流灾害',
          '2019-8-21'));
    }
    return Container(
      alignment: AlignmentDirectional.center,
      child: Wrap(
        spacing: tmpSetWidth(15.0),
        runSpacing: tmpSetHeight(15.0),
        children: tmpListWidget,
      ),
    );
  }

//获取数据信息
  getList(bool isLeft, bool isRight, bool isMiddle) {
    if (isLeft) {
      int length = widget.fireNews.length;
      for (var i = 0; i < length; i++) {
        listWidget.add(_singleNews(widget.fireNews[i].url,
            widget.fireNews[i].title, widget.fireNews[i].date));
      }
    } else if (isRight) {
      int length = widget.floodNews.length;
      for (var i = 0; i < length; i++) {
        listWidget.add(_singleNews(widget.floodNews[i].url,
            widget.floodNews[i].title, widget.floodNews[i].date));
      }
    } else if (isMiddle) {
      int length = widget.mudslideNews.length;
      for (var i = 0; i < length; i++) {
        listWidget.add(_singleNews(widget.mudslideNews[i].url,
            widget.mudslideNews[i].title, widget.mudslideNews[i].date));
      }
    }
  }
  _NavDetail(String id){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return VideoLearningPage(videoId: id,);
        }));
  }

  Widget _singleNews(String url, String newsTitle, String newsDate) {
    return Container(
      width: tmpSetWidth(350.0),
      height: tmpSetHeight(300.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/方框2.png'),
          fit: BoxFit.cover,
        ),
        //color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5.0)],
      ),
      child: InkWell(
        onTap: () {
          print('点击了新闻');
          _NavDetail('123');
        },
        child: Column(
          children: [
            Image.network(
              url,
              width: tmpSetWidth(350.0),
              height: tmpSetHeight(175.0),
              fit: BoxFit.cover,
            ),
            Container(
              padding: EdgeInsets.only(
                  top: tmpSetWidth(15.0), left: tmpSetWidth(10.0)),
              child: Text(
                newsTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: tmpSetFontSize(30.0),
                  color: Colors.grey[800],
                  height: 1,
                ),
              ),
            ),
            Spacer(),
            Container(
              height: tmpSetHeight(40.0),
              margin: EdgeInsets.only(left: tmpSetWidth(10.0)),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: tmpSetWidth(7.0)),
              child: Text(
                newsDate,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: tmpSetFontSize(22.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
