import 'package:flutter/material.dart';
import 'package:flutter_tmp/provide/home_provide.dart';
import 'package:flutter_tmp/utils/utils.dart';
import 'package:provider/provider.dart';

class HomeTabBar extends StatefulWidget {
  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar> {
  @override
  Widget build(BuildContext context) {
    HomePageProvide provider = Provider.of<HomePageProvide>(context);
    var isLeft = provider.isLeft;
    var isRight = provider.isRight;
    var isMiddle = provider.isMiddle;
    return Container(
      height:tmpSetHeight(80.0),
      width: tmpSetHeight(1334.0),
      color: Colors.transparent,
      child: Row(
        children: [
          _myTabBarLeft(context, isLeft),
          _myTabBarMiddle(context, isMiddle),
          _myTabBarRight(context, isRight)
        ],
      ),
    );
  }

  Widget _myTabBarLeft(BuildContext context, bool isLeft) {
    return InkWell(
      onTap: () {
        Provider.of<HomePageProvide>(context,listen: false).changeTabBar('left');
      },
      child: Container(
        width: tmpSetWidth(120.0),
        height: tmpSetHeight(60.0),
        alignment: AlignmentDirectional.center,
        child: Container(
          width: tmpSetWidth(66.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.5,
                color: isLeft ? Colors.green[200] : Colors.white,
              ),
            ),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            '火灾',
            style: TextStyle(
              color: Colors.black,
              fontWeight: isLeft ? FontWeight.w700 : FontWeight.w400,
              fontSize: tmpSetFontSize(32.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _myTabBarMiddle(BuildContext context, bool isMiddle) {
    return InkWell(
      onTap: () {
        Provider.of<HomePageProvide>(context,listen: false).changeTabBar('middle');
      },
      child: Container(
        width: tmpSetWidth(120.0),
        height: tmpSetHeight(60.0),
        alignment: AlignmentDirectional.center,
        child: Container(
          width: tmpSetWidth(98.0),
          decoration: BoxDecoration(
           // color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 1.5,
                color: isMiddle ? Colors.green[200] : Colors.white,
              ),
            ),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            '泥石流',
            style: TextStyle(
              color: Colors.black,
              fontWeight: isMiddle ? FontWeight.w700 : FontWeight.w400,
              fontSize: tmpSetFontSize(32.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _myTabBarRight(BuildContext context, bool isRight) {
    return InkWell(
      onTap: () {
        Provider.of<HomePageProvide>(context,listen: false).changeTabBar('right');
      },
      child: Container(
        width: tmpSetWidth(120.0),
        height: tmpSetHeight(60.0),
        alignment: AlignmentDirectional.center,
        child: Container(
          width: tmpSetWidth(66.0),
          decoration: BoxDecoration(
           // color: Colors.white,
            border: Border(
              bottom: BorderSide(
                width: 1.5,
                color: isRight ? Colors.green[200] : Colors.white,
              ),
            ),
          ),
          alignment: AlignmentDirectional.center,
          child: Text(
            '洪灾',
            style: TextStyle(
              color: Colors.black,
              fontWeight: isRight ? FontWeight.w700 : FontWeight.w400,
              fontSize: tmpSetFontSize(32.0),
            ),
          ),
        ),
      ),
    );
  }
}


