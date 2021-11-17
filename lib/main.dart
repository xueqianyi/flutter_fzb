import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tmp/navigator/tab_navigator.dart';
import 'package:flutter_tmp/page/welcome/welcome.dart';
import 'package:flutter_tmp/provide/avtivity_detail_provide.dart';
import 'package:flutter_tmp/provide/camera_provider.dart';
import 'package:flutter_tmp/provide/home_provide.dart';
import 'package:flutter_tmp/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tmp/provide/report_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<HomePageProvide>(
          create: (_) => new HomePageProvide(),
        ),
        ChangeNotifierProvider<ActivityDetailPageProvider>(
          create: (_) => new ActivityDetailPageProvider(),
        ),
        ChangeNotifierProvider<CameraProvider>(
          create: (_) => new CameraProvider(),
        ),
        ChangeNotifierProvider<ReportProvider>(
          create: (_) => new ReportProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      allowFontScaling: false,
      builder: () => MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: staticRoutes,
        home: WelcomePage(),
      ),
    );
  }
}
