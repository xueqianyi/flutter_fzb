import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_tmp/utils/utils.dart';

//首页顶部轮播组件
class TopBanner extends StatelessWidget {
  TopBanner({Key key, @required this.bannerList}) : super(key: key);
  final List bannerList; //保证不为空
  @override
  Widget build(BuildContext context) {
    return bannerList == null ?Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ):Container(
      padding: EdgeInsets.only(
        left: tmpSetWidth(16.0),
        right: tmpSetWidth(16.0),
        top: tmpSetHeight(15.0),
      ),
      height: tmpSetHeight(300.0),
      child: Swiper(
        autoplay: true,
        key: UniqueKey(),
        itemCount: bannerList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.asset(
            bannerList[index],
            fit: BoxFit.fill,
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}
