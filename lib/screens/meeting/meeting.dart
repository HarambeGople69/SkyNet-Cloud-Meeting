import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/screens/meeting/create_meeting.dart';
import 'package:myapp/screens/meeting/join_meeting.dart';
import 'package:myapp/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class MeetingMenu extends StatefulWidget {
  const MeetingMenu({Key? key}) : super(key: key);

  @override
  _MeetingMenuState createState() => _MeetingMenuState();
}

class _MeetingMenuState extends State<MeetingMenu> {
  List<Widget> display = const [
    JoinMeeting(),
    CreateMeeting(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Shimmer.fromColors(
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
          bottom: TabBar(
            labelPadding: EdgeInsets.all(ScreenUtil().setSp(5)),
            labelStyle: TextStyle(
              fontSize: ScreenUtil().setSp(17.5),
              fontWeight: FontWeight.w600,
            ),
            labelColor: Colors.white,
            indicatorColor: logoColor,
            tabs: const [
              Tab(
                text: "Join Meeting",
              ),
              Tab(
                text: "Create Meeting",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: display,
        ),
      ),
    );
  }
}
