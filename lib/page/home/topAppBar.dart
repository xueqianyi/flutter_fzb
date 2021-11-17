import 'package:flutter/material.dart';

class TopAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: true,
        leading: Container(
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_alert_outlined,
              color: Colors.black26,
            ),
          ),
        ),
        title: Container(
          child: Text(
            '首页',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Container(
            child: IconButton(
              icon: Icon(
                Icons.message_outlined,
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
