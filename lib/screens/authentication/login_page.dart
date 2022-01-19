import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';
import 'package:myapp/widgets/our_password_field.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:myapp/widgets/our_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email_controller = TextEditingController();
  TextEditingController _password_controller = TextEditingController();
  TextEditingController _name_controller = TextEditingController();
  TextEditingController _conform_controller = TextEditingController();
  bool see = true;
  bool csee = true;
  bool login = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setSp(20),
              vertical: ScreenUtil().setSp(10),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  fit: BoxFit.cover,
                  height: ScreenUtil().setSp(300),
                  width: ScreenUtil().setSp(300),
                ),
                OurSizedBox(),
                CustomTextField(
                  icon: Icons.email,
                  controller: _email_controller,
                  validator: (value) {},
                  title: "Enter email",
                  type: TextInputType.emailAddress,
                  number: 1,
                ),
                login ? Container() : OurSizedBox(),
                login
                    ? Container()
                    : CustomTextField(
                        icon: Icons.person,
                        controller: _name_controller,
                        validator: (value) {},
                        title: "Enter name",
                        type: TextInputType.name,
                        number: 1,
                      ),
                OurSizedBox(),
                PasswordForm(
                  controller: _password_controller,
                  validator: (value) {},
                  number: 1,
                  see: see,
                  changesee: () {
                    setState(() {
                      see = !see;
                    });
                  },
                  title: "Enter Password",
                ),
                login ? Container() : OurSizedBox(),
                login
                    ? Container()
                    : PasswordForm(
                        see: csee,
                        changesee: () {
                          setState(() {
                            csee = csee;
                          });
                        },
                        controller: _conform_controller,
                        title: "Re-enter Password",
                        validator: (value) {},
                        number: 1,
                      )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setSp(20),
                vertical: ScreenUtil().setSp(2),
              ),
              child: OurElevatedButton(
                title: login ? "Login" : "Back",
                function: () {
                  if (login) {
                    // OurToast().showErrorToast("User logged in  successfully");
                  } else {
                    setState(() {
                      login = !login;
                    });
                  }
                },
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setSp(20),
                vertical: ScreenUtil().setSp(2),
              ),
              child: OurElevatedButton(
                title: "Sign up",
                function: () {
                  if (login) {
                    setState(() {
                      login = !login;
                    });
                  } else {
                    // OurToast().showSuccessToast("User Signed Successfully");
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
