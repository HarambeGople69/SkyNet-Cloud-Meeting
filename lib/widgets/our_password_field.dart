import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/colors.dart';

class PasswordForm extends StatefulWidget {
  final bool see;
  final Function changesee;
  final FocusNode? start;
  final FocusNode? end;
  final String title;
  final Function(String)? validator;
  final int number;
  final Function(String)? onchange;

  final TextEditingController controller;

  const PasswordForm({
    Key? key,
    required this.see,
    required this.changesee,
    required this.controller,
    required this.title,
    required this.validator,
    this.onchange,
    this.start,
    this.end,
    required this.number,
  }) : super(key: key);

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setSp(40),
      child: TextFormField(
          cursorColor: Colors.white,
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
          validator: (String? value) => widget.validator!(value!),
          style: TextStyle(fontSize: ScreenUtil().setSp(15)),
          controller: widget.controller,
          obscureText: widget.see,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setSp(2),
              horizontal: ScreenUtil().setSp(2),
            ),
            isDense: true,
            prefixIcon: Icon(
              Icons.lock,
              color: logoColor,
              size: ScreenUtil().setSp(20),
            ),
            suffixIcon: InkWell(
                onTap: () {
                  widget.changesee();
                },
                child: widget.see
                    ? Icon(
                        Icons.visibility_off,
                        color: logoColor,
                        size: ScreenUtil().setSp(20),
                      )
                    : (Icon(
                        Icons.visibility,
                        color: logoColor,
                        size: ScreenUtil().setSp(20),
                      ))),
            labelText: widget.title,
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
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                ScreenUtil().setSp(
                  10,
                ),
              ),
            ),
            errorStyle: TextStyle(
              fontSize: ScreenUtil().setSp(
                15,
              ),
            ),
            labelStyle: TextStyle(
              color: logoColor,
              fontSize: ScreenUtil().setSp(
                17.5,
              ),
            ),
          )),
    );
  }
}
