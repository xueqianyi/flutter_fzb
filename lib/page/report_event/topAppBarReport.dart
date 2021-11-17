import 'package:flutter/material.dart';

class TopAppBarReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        // leading: Container(
        //   child: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(
        //       Icons.arrow_back_ios_rounded,
        //       color: Colors.black26,
        //     ),
        //   ),
        // ),
        title: Container(
          child: Text(
            '事件上传',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
