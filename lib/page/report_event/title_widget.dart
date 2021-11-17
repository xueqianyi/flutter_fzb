import 'package:flutter/material.dart';
import 'package:flutter_tmp/utils/utils.dart';

Widget titleWidget(String value) {
  return Container(
    height:tmpSetHeight(32.0),
    margin: EdgeInsets.only(left: tmpSetWidth(20.0)),
    padding: EdgeInsets.only(left: tmpSetWidth(20.0)),
    decoration: BoxDecoration(
        border: Border(
            left: BorderSide(
              color: Colors.green,
              width: tmpSetWidth(10.0),
            ))),
    child: Text(
      value,
      style: TextStyle(color: Colors.black54,fontSize: tmpSetFontSize(30.0)),
    ),
  );
}