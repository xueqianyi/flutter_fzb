import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_tmp/api/api.dart';
import 'package:flutter_tmp/model/activity_model.dart';
import 'package:flutter_tmp/model/enroll_model.dart';
import 'package:flutter_tmp/page/community_campaign/activity_detail/topAppBarCommunity.dart';
import 'package:flutter_tmp/provide/avtivity_detail_provide.dart';
import 'package:flutter_tmp/utils/screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ActivityDetailPage extends StatefulWidget {
  //final activityId;

  final activityId;

  ActivityDetailPage({Key key, this.activityId}) : super(key: key);

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  ActivityModel activityModel;

  _loadDataDetail(String id) async {
    print('开始读入活动详细页数据');
    activityModel = await API.findActivity(id);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _loadDataDetail(widget.activityId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: activityModel == null
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  TopAppBarCommunity(),
                  activityImage(),
                  ActivityTabBar(),
                  Details(
                    activityModel: activityModel,
                  ),
                ],
              ),
            ),
    );
  }

  Widget activityImage() {
    return activityModel == null
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            child: Image.network(
              activityModel.date, //date表示图片url
              width: tmpSetWidth(750.0),
              height: tmpSetHeight(400.0),
              fit: BoxFit.cover,
            ),
          );
  }
}

//按钮切换
class ActivityTabBar extends StatefulWidget {
  @override
  _ActivityTabBarState createState() => _ActivityTabBarState();
}

class _ActivityTabBarState extends State<ActivityTabBar> {
  @override
  Widget build(BuildContext context) {
    ActivityDetailPageProvider provider =
        Provider.of<ActivityDetailPageProvider>(context);
    var isLeft = provider.isLeft;
    var isRight = provider.isRight;
    return Container(
      child: Row(
        children: <Widget>[
          _myTabBarLeft(context, isLeft),
          _myTabBarRight(context, isRight)
        ],
      ),
    );
  }

  Widget _myTabBarLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provider.of<ActivityDetailPageProvider>(context, listen: false)
            .changeTabBar('left');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: tmpSetWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 1.5,
              color: isLeft ? Colors.green : Colors.black12,
            ))),
        child: Text(
          '活动详情',
          style: TextStyle(
            color: Colors.black,
            fontWeight: isLeft ? FontWeight.w700 : FontWeight.w400,
            fontSize: tmpSetFontSize(30),
          ),
        ),
      ),
    );
  }

  Widget _myTabBarRight(BuildContext context, bool isRight) {
    return InkWell(
      onTap: () {
        Provider.of<ActivityDetailPageProvider>(context, listen: false)
            .changeTabBar('right');
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        width: tmpSetWidth(375),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(
              width: 1.5,
              color: isRight ? Colors.green : Colors.black12,
            ))),
        child: Text(
          '已参与人员',
          style: TextStyle(
            color: Colors.black,
            fontWeight: isRight ? FontWeight.w700 : FontWeight.w400,
            fontSize: tmpSetFontSize(30),
          ),
        ),
      ),
    );
  }
}

//内容切换
class Details extends StatefulWidget {
  final ActivityModel activityModel;

  Details({Key key, this.activityModel}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  EnrollModel enrollModel;
  bool isEnroll = false;
  String reminder;

  loadInit() async {
    print('查看是否报名----------');
    enrollModel = await API.enrollActivity(widget.activityModel.name, 'xuexiaomi1922');

    if (mounted) {
      setState(() {
        if (enrollModel.err == -1) {
          isEnroll = true;
        }
        reminder = enrollModel.msg;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadInit();
  }

  @override
  Widget build(BuildContext context) {
    ActivityDetailPageProvider provider =
        Provider.of<ActivityDetailPageProvider>(context);
    var isLeft = provider.isLeft;
    var isRight = provider.isRight;
    return widget.activityModel == null
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            child: Column(
              children: [
                isLeft
                    ? Container(
                        height: tmpSetHeight(600),
                        child: SingleChildScrollView(
                          child: _content(widget.activityModel.name,
                              widget.activityModel.introduction),
                        ),
                      )
                    : Container(
                        height: tmpSetHeight(600),
                        child: UserList(),
                      ),
                _signButton(),
              ],
            ),
          );
  }

  //社区活动简介
  Widget _content(String activityName, String intro) {
    return Column(
      children: [
        //主题
        Container(
          height: tmpSetHeight(70.0),
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.only(left: tmpSetWidth(10.0)),
          child: Text(
            activityName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: tmpSetFontSize(35),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        //简介
        Container(
          alignment: AlignmentDirectional.centerStart,
          padding: EdgeInsets.only(left: tmpSetWidth(10.0)),
          child: Text(
            '简介',
            style: TextStyle(
              fontSize: tmpSetFontSize(30),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: tmpSetWidth(10.0)),
          child: Text(
            intro,
            style: TextStyle(
              color: Colors.grey,
              fontSize: tmpSetFontSize(30.0),
            ),
          ),
        )
      ],
    );
  }

  ifenroll() async {
    print('开始报名------------');
    enrollModel = await API.enrollActivity(widget.activityModel.name, 'xuexiaomi1922');
    if (mounted) {
      setState(() {
        isEnroll = true;
        print(reminder);
      });
    }
  }

  Widget _signButton() {
    return Container(
      height: tmpSetHeight(78.0),
      width: tmpSetWidth(750.0),
      margin: EdgeInsets.only(
        top: tmpSetHeight(20.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: tmpSetWidth(15.0)),
      alignment: AlignmentDirectional.center,
      child: ButtonTheme(
        minWidth: tmpSetWidth(720.0),
        child: RaisedButton(
          onPressed: () {
            print('点击了报名按钮');
            ifenroll();
            Fluttertoast.showToast(
                msg: reminder,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black45,
                textColor: Colors.white,
                fontSize: 16.0);
          },
          child: Text(
            '报名',
            style: TextStyle(
              fontSize: tmpSetFontSize(32.0),
              fontWeight: FontWeight.w700,
            ),
          ),
          textColor: Colors.white,
          color: !isEnroll ? Colors.greenAccent[400] : Colors.black26,
          shape: StadiumBorder(),
          //两边设置半圆形
          elevation: 5,
          highlightColor: Colors.green,
        ),
      ),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    ActivityDetailPageProvider provider =
        Provider.of<ActivityDetailPageProvider>(context);
    var data = provider.result;
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 0.0),
        shrinkWrap: true,
        controller: controller,
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return _singleUser(data[index]);
        },
      ),
    );
  }

  Widget _singleUser(model) {
    return Container(
      width: tmpSetWidth(750.0),
      height: tmpSetHeight(100.0),
      child: Row(
        children: [
          Container(
            width: tmpSetWidth(80.0),
            margin: EdgeInsets.only(left: tmpSetWidth(15.0)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(model['avatarUrl']),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: tmpSetWidth(15.0)),
            child: Text(
              '${model['userName']}',
              style: TextStyle(
                color: Colors.black,
                fontSize: tmpSetFontSize(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
