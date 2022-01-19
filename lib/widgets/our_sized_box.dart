import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OurSizedBox extends StatefulWidget {
  const OurSizedBox({Key? key}) : super(key: key);

  @override
  _OurSizedBoxState createState() => _OurSizedBoxState();
}

class _OurSizedBoxState extends State<OurSizedBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setSp(
        10,
      ),
    );
  }
}
