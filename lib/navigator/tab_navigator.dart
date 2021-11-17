import 'package:flutter/material.dart';
import 'package:flutter_tmp/page/home/home_page.dart';
import 'package:flutter_tmp/page/map/community_map.dart';
import 'package:flutter_tmp/page/my/my_page.dart';
import 'package:flutter_tmp/page/report_event/report_event.dart';
import 'package:flutter_tmp/utils/utils.dart';


class TmpBottomNavigator extends StatefulWidget {
  @override
  _TmpBottomNavigatorState createState() => _TmpBottomNavigatorState();
}

class _TmpBottomNavigatorState extends State<TmpBottomNavigator> {
  final PageController _controller =PageController(initialPage: 0);

  int _currentIndex = 0;

  final _defaultColor = Colors.grey;
  final _activeColor = Colors.greenAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          CommunityMap(),
          ReportEvent(),
          MyPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        iconSize: tmpSetWidth(60.0),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _defaultColor ,
            ),
            activeIcon: Icon(
              Icons.home,
              color: _activeColor,
            ),
            title: Text(
              '首页',
              style: TextStyle(
                color:_currentIndex!=0?_defaultColor:_activeColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              color: _defaultColor ,
            ),
            activeIcon: Icon(
              Icons.map,
              color: _activeColor,
            ),
            title: Text(
              '社区地图',
              style: TextStyle(
                color:_currentIndex!=1?_defaultColor:_activeColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.drive_folder_upload,
              color: _defaultColor ,
            ),
            activeIcon: Icon(
              Icons.drive_folder_upload,
              color: _activeColor,
            ),
            title: Text(
              '上报事件',
              style: TextStyle(
                color:_currentIndex!=2?_defaultColor:_activeColor,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _defaultColor ,
            ),
            activeIcon: Icon(
              Icons.person,
              color: _activeColor,
            ),
            title: Text(
              '我的',
              style: TextStyle(
                color:_currentIndex!=3?_defaultColor:_activeColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}


