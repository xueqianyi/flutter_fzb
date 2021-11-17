import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tmp/model/activity_model.dart';
import 'package:flutter_tmp/page/community_campaign/activity_detail/activity_detail.dart';
import 'package:flutter_tmp/page/community_campaign/topAppBarCommunity.dart';
import 'package:flutter_tmp/utils/utils.dart';
import 'package:flutter_tmp/api/api.dart';

class ComunnityActivity extends StatefulWidget {
  @override
  _ComunnityActivityState createState() => _ComunnityActivityState();
}

class _ComunnityActivityState extends State<ComunnityActivity> {
  String url =
      'https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3648071327,4273396974&fm=26&gp=0.jpg';
  String activityName = '活动活动活动';
  String activityDate = '2021-04-03';
  String activityPlace = '四川大学江安校区';
  String activityInfo = '简介简介简介简介简介简介简介简介简介简介简介';
  bool ifStart = false;
  String activityId = 'abcde';
  List<ActivityModel> activityList;
  List<Widget> activityWidgtList;

  _loadData()async{
    print('开始读入活动数据');
    activityList = await API.getActivityPage();
    //print(activityList[0].name);
    if (mounted) {
      setState(() {
      });
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: activityList == null?Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ):Column(
          children: [
            TopAppBarCommunity(),
            ActivityList(
              activityList:activityList,
            )
          ],
        ),
      ),
    );
  }
  getActivityList(List<ActivityModel> activityList){
    for(var i = 0;i<activityList.length;i++){
      activityWidgtList.add(SingleActivity(url: activityList[i].date,activityName: activityList[i].name,activityDate: '2021-04-03',activityPlace: activityList[i].location,activityInfo: activityList[i].activityId,));
    }
  }
}

//活动列表
class ActivityList extends StatefulWidget {
  final  List<ActivityModel> activityList;

  ActivityList({Key key,this.activityList}) : super(key: key);

  @override
  _ActivityListState createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  List<Widget> activityWidgtList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getActivityList(widget.activityList);
  }
  @override
  Widget build(BuildContext context) {
   // List<Widget> tmpactivityList = [widget.model, widget.model, widget.model];
    return widget.activityList==null?Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ):Container(
      height: tmpSetHeight(1200.0),
      width: tmpSetWidth(750),
      child: ListView.builder(
        padding: EdgeInsets.only(top: tmpSetHeight(10.0)),
        itemCount: activityWidgtList.length,
        itemBuilder: (BuildContext context, int index) {
          return activityWidgtList[index];
        },
      ),
    );
  }

  //暂且把date转成imageurl
  getActivityList(List<ActivityModel> activityList){
    for(var i = 0;i<activityList.length;i++){
      activityWidgtList.add(SingleActivity(url: activityList[i].date,activityName: activityList[i].name,activityDate: '2021-04-03',activityPlace: activityList[i].location,activityInfo: activityList[i].activityId,ifStart: false,));
    }
  }
}

//单个活动
class SingleActivity extends StatefulWidget {
  //此处模拟，直接传model
  final url;
  final activityName;
  final activityDate;
  final activityPlace;
  final activityInfo;
  final ifStart;

  SingleActivity({
    Key key,
    this.url,
    this.activityName,
    this.activityDate,
    this.activityPlace,
    this.activityInfo,
    this.ifStart,
  }) : super(key: key);

  @override
  _SingleActivityState createState() => _SingleActivityState();
}

class _SingleActivityState extends State<SingleActivity> {
  _NavDetail(id){
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context){
          return ActivityDetailPage(activityId: id,);
        }));
  }

  @override
  Widget build(BuildContext context) {
   // VoidCallback back = widget.callBack;
    return Container(
      width: tmpSetWidth(750),
      height: tmpSetHeight(242),
      alignment: AlignmentDirectional.center,
      child:InkWell(
        onTap: (){
          _NavDetail(widget.activityInfo);
        },
        child:  Container(
          //  margin: EdgeInsets.only(top: tmpSetHeight(10.0)),
          width: tmpSetWidth(716.0),
          height: tmpSetHeight(232.0),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
           // color: Colors.white,
            image: DecorationImage(
              image: AssetImage('assets/images/职位框.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8.0)],
          ),
          //  color: Colors.blue,
          child: Container(
            child: Row(
              children: [
                Container(
                  alignment: AlignmentDirectional.topStart,
                  //  color: Colors.redAccent,
                  padding: EdgeInsets.only(
                    top: tmpSetHeight(16.0),
                    left: tmpSetWidth(16.0),
                  ),
                  child: Image.network(
                    widget.url,
                    width: tmpSetWidth(200.0),
                    height: tmpSetHeight(160.0),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  // color: Colors.green,
                  margin: EdgeInsets.only(
                    left: tmpSetWidth(20.0),
                  ),
                  //  alignment: AlignmentDirectional.topCenter,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: tmpSetWidth(460.0),
                        // color: Colors.yellow,
                        padding: EdgeInsets.only(
                          top: tmpSetHeight(16.0),
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                widget.activityName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: tmpSetFontSize(32),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: Text(
                                widget.ifStart ? '已开始' : '未开始',
                                style: TextStyle(
                                  fontSize: tmpSetFontSize(25),
                                  color: widget.ifStart
                                      ? Colors.green
                                      : Colors.black26,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          '日期: ${widget.activityDate}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: tmpSetFontSize(25),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '地点: ${widget.activityPlace}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: tmpSetFontSize(25),
                          ),
                        ),
                      ),
                      Container(
                        height: tmpSetHeight(80.0),
                        width: tmpSetWidth(460.0),
                        //  color: Colors.greenAccent,
                        child: Text(
                          '简介: ${widget.activityInfo}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: tmpSetFontSize(25),
                          ),
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
