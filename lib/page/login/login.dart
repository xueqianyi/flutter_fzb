import 'package:flutter/material.dart';
import 'package:flutter_tmp/utils/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/signbackground.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //切换栏
          Positioned(
            top: tmpSetHeight(190),
            left: tmpSetWidth(60),
            height: tmpSetHeight(80),
            width: tmpSetWidth(400),
            child: Container(
              child: TopBar(),
            ),
          ),
          //手机号
          Positioned(
            top:  tmpSetHeight(300),
            left: tmpSetWidth(60),
            height:  tmpSetHeight(90),
            width: tmpSetWidth(560),
            child: Row(
              children: [
                Container(
                  height: tmpSetWidth(90),
                  width: tmpSetWidth(90),
                  decoration: BoxDecoration(
                    //color: Colors.yellow,
                  ),
                  child: SignIcon(Color.fromARGB(255, 197, 232, 208),
                      Icons.person_outline_rounded, Colors.white, 40.0),
                ),
                Spacer(),
                Container(
                  height: tmpSetWidth(90),
                  width: tmpSetWidth(400),
                  decoration: BoxDecoration(
                    // color: Colors.pink,
                  ),
                  child: SignText(),
                ),
              ],
            ),
          ),
          //密码
          Positioned(
            top:  tmpSetHeight(400),
            left: tmpSetWidth(60),
            height: tmpSetWidth(160),
            width: tmpSetWidth(560),
            child: Row(
              children: [
                Container(
                  height: tmpSetWidth(90),
                  width: tmpSetWidth(90),
                  decoration: BoxDecoration(
                    //color: Colors.yellow,
                  ),
                  child: SignIcon(Color.fromARGB(255, 197, 232, 208),
                      Icons.lock, Colors.white, 35.0),
                ),
                Spacer(),
                Container(
                  height: tmpSetWidth(90),
                  width: tmpSetWidth(400),
                  decoration: BoxDecoration(
                    // color: Colors.pink,
                  ),
                  child: SignPassword(),
                ),
              ],
            ),
          ),
          //登录按钮
          Positioned(
            top: tmpSetHeight(600),
            left: tmpSetWidth(60),
            height: tmpSetWidth(80),
            width: tmpSetWidth(560),
            child: Container(
              height: tmpSetWidth(200),
              decoration: BoxDecoration(
                // color: Colors.yellow,
              ),
              child: SignBtn('登 录',context),
            ),
          ),
          Positioned(
            top: tmpSetHeight(690),
            left: tmpSetWidth(60),
            height: tmpSetWidth(80),
            width: tmpSetWidth(560),
            child: Container(
              height: tmpSetWidth(200),
              decoration: BoxDecoration(
                // color: Colors.yellow,
              ),
              alignment: Alignment.centerRight,
              child: Text('还没注册？',style: TextStyle(color: Colors.black26,fontSize: tmpSetFontSize(30)),),
            ),
          ),
        ],
      ),
    );
  }
}

//顶部切换
class TopBar extends StatefulWidget {
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool isresident;

  @override
  void initState() {
    super.initState();
    isresident = true;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            height: tmpSetHeight(60),
            width: tmpSetWidth(170),
            decoration: BoxDecoration(
              border: Border.all(
                color: !isresident
                    ? Color.fromARGB(255, 137, 206, 188)
                    : Colors.white38,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: !isresident
                  ? Color.fromARGB(255, 197, 232, 208)
                  : Color.fromARGB(255, 235, 248, 231),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  isresident = !isresident;
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '管理员',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: tmpSetFontSize(32),
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: tmpSetWidth(90),
          top: 0,
          child: Container(
            height: tmpSetHeight(60),
            width: tmpSetWidth(170),
            decoration: BoxDecoration(
              border: Border.all(
                color: isresident
                    ? Color.fromARGB(255, 137, 206, 188)
                    : Colors.white38,
              ),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
              color: isresident
                  ? Color.fromARGB(255, 197, 232, 208)
                  : Color.fromARGB(255, 235, 248, 231),
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  isresident = !isresident;
                });
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  '居民',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: tmpSetFontSize(32),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//图标
Widget SignIcon(gbcolor, icon, iconcolor, size) {
  return Container(
    decoration: BoxDecoration(
      color: gbcolor,
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Icon(
      icon,
      color: iconcolor,
      size: size,
    ),
  );
}

//手机号文本框
class SignText extends StatefulWidget {
  @override
  _SignTextState createState() => _SignTextState();
}

class _SignTextState extends State<SignText> {
  //手机号控制器
  final TextEditingController _telphoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tmpSetWidth(90),
      width: tmpSetWidth(500),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 242, 228),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: _telphoneController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '请输入手机号',
          contentPadding: EdgeInsets.fromLTRB(18, 15, 0, 9),
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 200, 210, 202),
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: tmpSetFontSize(30),
        ),
        autocorrect: false,
      ),
    );
  }
}

//密码文本框
class SignPassword extends StatefulWidget {
  @override
  _SignPasswordState createState() => _SignPasswordState();
}

class _SignPasswordState extends State<SignPassword> {
  //密码控制器
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tmpSetWidth(160),
      width: tmpSetWidth(628),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 239, 242, 228),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: _passwordController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '请输入密码',
          contentPadding: EdgeInsets.fromLTRB(18, 15, 0, 9),
          hintStyle: TextStyle(
            color: Color.fromARGB(255, 200, 210, 202),
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: tmpSetFontSize(30),
        ),
        autocorrect: false,
      ),
    );
  }
}

//按钮
Widget SignBtn(title,context){
  return Container(
    height: tmpSetWidth(160),
    width: tmpSetWidth(860),
    decoration: BoxDecoration(
      color: Color.fromARGB(255,137,206,188),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: FlatButton(
      onPressed: (){
        Navigator.pushNamed(context, '/total-tab');
      },
      child: Text(
        title,
        textAlign: TextAlign.center,
        style:TextStyle(
          color: Colors.white70,
          fontSize: tmpSetFontSize(50),
        ),
      ),
    ),
  );
}
