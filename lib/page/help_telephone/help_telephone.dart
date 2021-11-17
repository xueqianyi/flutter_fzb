import 'package:flutter/material.dart';
import 'package:flutter_tmp/page/help_telephone/topAppBarHelp.dart';
import 'package:flutter_tmp/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpTelPage extends StatefulWidget {
  @override
  _HelpTelPageState createState() => _HelpTelPageState();
}

class _HelpTelPageState extends State<HelpTelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/反馈背景页.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              TopAppBarHelp(),
              TelList(telList: ['111'],),
            ],
          ),
        ),
      ),
    );
  }
}

//电话列表
class TelList extends StatefulWidget {
  final  List telList;
  TelList({Key key,this.telList}):super(key: key);

  @override
  _TelListState createState() => _TelListState();
}

class _TelListState extends State<TelList> {
  List<Widget> telephoneList = [];
  @override
  void initState() {
    super.initState();
    getTelList();
  }
  @override
  Widget build(BuildContext context) {
    return widget.telList==null?Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ):Container(
      height: tmpSetHeight(1200.0),
      width: tmpSetWidth(750),
      child: ListView.builder(
        padding: EdgeInsets.only(top: tmpSetHeight(10.0)),
        itemCount: telephoneList.length,
        itemBuilder: (BuildContext context, int index) {
          return telephoneList[index];
        },
      ),
    );
  }

  getTelList(){
    for(var i = 0;i<6;i++){
      telephoneList.add(SingleTel(tel: '18510725552',));
    }
  }
}

//单个电话
class SingleTel extends StatelessWidget {
  String tel;
  SingleTel({Key key,this.tel}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tmpSetWidth(750),
      height: tmpSetHeight(242),
      alignment: AlignmentDirectional.center,
      child: InkWell(
        onTap: () {
          print('点击了电话');
          _launchURL();
        },
        child: Container(
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
                    'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1684798717,3934386642&fm=26&gp=0.jpg',
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
                                'xxx职位',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: tmpSetFontSize(32),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          '姓名: 张三',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: tmpSetFontSize(25),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          '电话: ${tel}',
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
                          '办公地点: 四川大学江安校区四川大学江安校区四川大学江安校区四川大学江安校区四川大学江安校区',
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
  void _launchURL() async {
    String url = 'tel:' + tel;
    if (await canLaunch(url)) {
      //是否可用,是否可以拨打，路径合法
      await launch(url);
    } else {
      throw 'url不能进行访问，异常';
    }
  }
}
