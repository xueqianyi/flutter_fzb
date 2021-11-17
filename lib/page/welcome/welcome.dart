import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tmp/page/login/login.dart';
import 'package:flutter_tmp/utils/utils.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Timer _timer;
  int count = 3;

  startTime() async{
    var _duration = Duration(seconds: 1);
    Timer(_duration,(){
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        count--;
        if(count == 0){
          navigatePage();
        }else{
          setState(() {
          });
        }
      });
      return _timer;
    });
  }

  void navigatePage(){
    _timer.cancel();
    Navigator.push(
      context,
      new MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/welcomepage.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: tmpSetWidth(50),
              right: tmpSetWidth(50),
              width: tmpSetWidth(80),
              height: tmpSetWidth(80),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(100, 255, 255, 255),
                  border: Border.all(
                    color: Colors.white30,
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$count',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}
