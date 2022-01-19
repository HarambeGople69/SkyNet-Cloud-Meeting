import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:shimmer/shimmer.dart';

class CreateMeeting extends StatefulWidget {
  const CreateMeeting({Key? key}) : super(key: key);

  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String code = "";

  void setcode() {
    setState(() {
      code = Uuid().v4().substring(0, 6);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setSp(10),
        vertical: ScreenUtil().setSp(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create a code and share it with your friends",
            style: TextStyle(
              fontSize: ScreenUtil().setSp(17.5),
              fontWeight: FontWeight.w500,
            ),
          ),
          OurSizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Code:",
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: ScreenUtil().setSp(20),
              ),
              Shimmer.fromColors(
                baseColor: lightlogoColor,
                highlightColor: logoColor,
                child: Text(
                  "$code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(20),
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          OurSizedBox(),
          OurElevatedButton(
            title: "Generate Code",
            function: () {
              setcode();
            },
          ),
        ],
      ),
    ));
  }
}
