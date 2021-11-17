import 'package:flutter/material.dart';
import 'package:flutter_tmp/utils/utils.dart';

//首页顶部按钮
class TopNavButton extends StatelessWidget {
  final  topNavButton;
  final context;
  TopNavButton({Key key, this.topNavButton,this.context}) : super(key: key);

  _navCommunity(){
    Navigator.pushNamed(context, '/community-activity');
  }
  _navAdvice(){
    Navigator.pushNamed(context, '/advice');
  }
  _navTel(){
    Navigator.pushNamed(context, '/help-telephone');
  }
  @override
  Widget build(BuildContext context) {

    return topNavButton.length<4?Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ):Container(
      margin: EdgeInsets.all(10.0),
      height: tmpSetHeight(150.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black12,width: 1),
      ),
      padding: EdgeInsets.only(top: tmpSetHeight(15.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          singleNav(topNavButton[0], '社区活动',_navCommunity),
          singleNav(topNavButton[1], '意见反馈',_navAdvice),
          singleNav(topNavButton[2], '便民服务',_navTel),
          singleNav(topNavButton[3], '调度中心',(){}),
        ],
      ),
    );
  }

  Widget singleNav(String url, String tmpTheme,VoidCallback callBack) {
    return Container(
      child: InkWell(
        onTap: callBack,
        child: Column(
          children: [
            Image.asset(
              url,
              width: tmpSetWidth(82.0),
              height: tmpSetWidth(82.0),
            ),
            Container(
              height: tmpSetHeight(8.0),
            ),
            Text(
              tmpTheme,
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}






