import 'package:flutter/material.dart';

class CommunityMap extends StatefulWidget {
  @override
  _CommunityMapState createState() => _CommunityMapState();
}

class _CommunityMapState extends State<CommunityMap> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/map.png'),
          fit: BoxFit.cover,
        ),
        //color: Colors.white
      ),
    ));
  }
}
