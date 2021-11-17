import 'package:flutter/material.dart';
import 'package:flutter_tmp/utils/utils.dart';

class TopPerson extends StatefulWidget {
  @override
  _TopPersonState createState() => _TopPersonState();
}

class _TopPersonState extends State<TopPerson> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: tmpSetWidth(750.0),
      height: tmpSetHeight(300.0),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage('assets/images/signbackground.jpg'),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: tmpSetHeight(48.0)),
            child: InkWell(
              onTap: (){
                print('点击了头像');
              },
              child: ClipOval(
                child: Image.network(
                  "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1811281320,4080086453&fm=11&gp=0.jpg",
                  width: tmpSetWidth(120.0),),
              ),
            ),//头像组件
          ),
          Container(
              margin: EdgeInsets.only(top: tmpSetHeight(10.0)),
              child: Text('张三',
                style: TextStyle(
                    fontSize: tmpSetFontSize(30.0),
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              )
          )
        ],
      ),
    );
  }
}