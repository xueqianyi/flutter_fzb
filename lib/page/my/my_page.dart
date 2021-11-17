import 'package:flutter/material.dart';
import 'package:flutter_tmp/page/my/top_person.dart';
import 'package:flutter_tmp/utils/utils.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  List<String> itemNames = ['学习记录','我的积分','我的荣誉','事件上报记录'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/signbackground.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              TopPerson(),
              ItemList(itemNames: itemNames,),
            ],
          ),
        ),
      ),
    );
  }
}


class ItemList extends StatelessWidget {
  final List itemNames;
  ItemList({Key key,this.itemNames}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return ( itemNames.length  != null)?Container(
      height: tmpSetHeight(550.0),
      child: ListView.builder(
        padding: EdgeInsets.only(top: tmpSetHeight(10.0)),
        itemCount:itemNames.length,
        itemBuilder: (BuildContext context,int index){
          return SingleTap(itemTitle: itemNames[index]);
        },
      ),
    ):Container();
  }
}

class SingleTap extends StatelessWidget {
  final itemTitle;

  SingleTap({Key key, this.itemTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Container(
        width: tmpSetWidth(750.0),
        height: tmpSetHeight(95.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0,color: Colors.black12),
          ),
        ),
        child: ListTile(
          title: Text(
            itemTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: tmpSetFontSize(35.0),
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.arrow_forward_ios_rounded),
            onPressed: (){
              print('点击了按钮');
            },
          ),
        ),
      ),
      Container(
        height: tmpSetHeight(5.0),
      ),
      ],
    );
  }
}
