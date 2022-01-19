import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class OurToast {
  showSuccessToast(String string) => Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade400,
        textColor: Colors.white,
        fontSize: ScreenUtil().setSp(15),
      );

  showErrorToast(String string) => Fluttertoast.showToast(
        msg: string,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xffaa4131),
        textColor: Colors.white,
        fontSize: ScreenUtil().setSp(15),
      );
}
