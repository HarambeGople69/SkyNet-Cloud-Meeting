import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/colors.dart';

class OurElevatedButton extends StatelessWidget {
  final String title;
  final Function function;
  const OurElevatedButton(
      {Key? key, required this.title, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        ScreenUtil().setSp(15),
      ),
      child: SizedBox(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              logoColor,
            ),
          ),
          onPressed: () {
            function();
          },
          child: Text(
            title,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(
                20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
