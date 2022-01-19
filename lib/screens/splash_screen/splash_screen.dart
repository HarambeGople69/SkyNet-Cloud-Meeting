import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:myapp/screens/authentication/login_page.dart';
import 'package:myapp/screens/outer%20layer/outer_layer.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void completed() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => OuterLayer(),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), completed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.cover,
              height: ScreenUtil().setSp(300),
              width: ScreenUtil().setSp(300),
            ),
          ),
          Shimmer.fromColors(
            baseColor: lightlogoColor,
            highlightColor: logoColor,
            child: Text(
              "SkyNet: Cloud Meeting",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const OurSizedBox(),
          const OurSizedBox(),
          const OurSizedBox(),
          SpinKitFadingCube(
            color: logoColor,
            size: ScreenUtil().setSp(50),
          ),
        ],
      ),
    );
  }
}
