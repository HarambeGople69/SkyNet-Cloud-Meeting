import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? start;
  final FocusNode? end;
  final Function(String) validator;
  final Function(String)? onchange;
  final IconData? icon;
  final TextInputType type;
  final String title;
  final int? length;
  final int number;
  final String? initialValue;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.validator,
    this.icon,
    this.onchange,
    required this.title,
    required this.type,
    this.length,
    this.start,
    this.end,
    required this.number,
    this.initialValue,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setSp(40),
      child: TextFormField(
        cursorColor: Colors.white,
        controller: widget.controller,
        initialValue: widget.initialValue,
        focusNode: widget.start,
        onEditingComplete: () {
          if (widget.number == 0) {
            FocusScope.of(context).requestFocus(
              widget.end,
            );
          } else {
            FocusScope.of(context).unfocus();
          }
        },
        onChanged: (String value) => widget.onchange ?? (value),
        validator: (String? value) => widget.validator(value!),
        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
        keyboardType: widget.type,
        maxLines: widget.length,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setSp(2),
            horizontal: ScreenUtil().setSp(2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: logoColor,
            ),
            borderRadius: BorderRadius.circular(
              ScreenUtil().setSp(
                10,
              ),
            ),
          ),
          isDense: true,
          labelText: widget.title,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              ScreenUtil().setSp(
                10,
              ),
            ),
          ),
          labelStyle: TextStyle(
            color: logoColor,
            fontSize: ScreenUtil().setSp(
              17.5,
            ),
          ),
          prefixIcon: Icon(
            widget.icon,
            size: ScreenUtil().setSp(20),
            color: logoColor,
          ),
          errorStyle: TextStyle(
            fontSize: ScreenUtil().setSp(
              13.5,
            ),
          ),
        ),
      ),
    );
  }
}
