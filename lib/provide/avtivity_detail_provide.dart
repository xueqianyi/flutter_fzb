import 'package:flutter/material.dart';
import 'package:flutter_tmp/model/user_list.dart';

class ActivityDetailPageProvider with ChangeNotifier {
  bool isLeft = true;
  bool isRight = false;

  List<Contact> contacts = List<Contact>();
  List<Map<String, dynamic>> result=List<Map<String, dynamic>>();

  ActivityDetailPageProvider() {
    for (var item in users) {
      contacts.add(Contact(
        avatarUrl: item['avatar_url'].toString(),
        userName: item['name'].toString(),
      ));
      result.add(Contact.toMap(contacts.last));
    }
  }

  //切换方法
  changeTabBar(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else if (changeState == 'right') {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
