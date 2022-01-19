import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp/controller/authentication_controller.dart';
import 'package:myapp/models/usermodel.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';
import 'package:myapp/widgets/our_sized_box.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class JoinMeeting extends StatefulWidget {
  const JoinMeeting({Key? key}) : super(key: key);

  @override
  _JoinMeetingState createState() => _JoinMeetingState();
}

class _JoinMeetingState extends State<JoinMeeting> {
  TextEditingController controller = TextEditingController(text: "");
  int pinLength = 6;
  bool videoMute = false;
  bool audioMute = false;

  _joinMeeting(String name) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p

      var options = JitsiMeetingOptions(room: controller.text)
        ..userDisplayName = name
        ..audioMuted = audioMute
        ..videoMuted = videoMute;
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      debugPrint("error: $error");
      OurToast().showErrorToast(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => ModalProgressHUD(
          inAsyncCall: Get.find<AuthenticationController>().processing.value,
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Users")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasData) {
                      UserModel userModel = UserModel.fromJson(
                          snapshot.data!.data() as Map<dynamic, dynamic>);
                      // Map<String,dynamic> map = snapshot.data;
                      snapshot.data!.data();
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setSp(10),
                          vertical: ScreenUtil().setSp(10),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "Room Code:",
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(20),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              OurSizedBox(),
                              Center(
                                child: PinCodeTextField(
                                  // autofocus: true,
                                  controller: controller,
                                  hideCharacter: false,
                                  highlight: true,
                                  highlightColor: Colors.blue,
                                  defaultBorderColor: Colors.black,
                                  hasTextBorderColor: logoColor,
                                  highlightPinBoxColor: lightlogoColor,
                                  maxLength: pinLength,

                                  pinBoxWidth: ScreenUtil().setSp(50),
                                  pinBoxHeight: ScreenUtil().setSp(65),
                                  hasUnderline: true,
                                  wrapAlignment: WrapAlignment.spaceAround,
                                  pinBoxDecoration: ProvidedPinBoxDecoration
                                      .defaultPinBoxDecoration,
                                  pinTextStyle: TextStyle(
                                    fontSize: ScreenUtil().setSp(20),
                                  ),
                                  pinTextAnimatedSwitcherTransition:
                                      ProvidedPinBoxTextAnimation
                                          .scalingTransition,
                                  //                    pinBoxColor: Colors.green[100],
                                  pinTextAnimatedSwitcherDuration:
                                      Duration(milliseconds: 300),
                                  //                    highlightAnimation: true,
                                  highlightAnimationBeginColor: Colors.black,
                                  highlightAnimationEndColor: Colors.white12,

                                  keyboardType: TextInputType.name,
                                ),
                              ),
                              OurSizedBox(),
                              CheckboxListTile(
                                activeColor: logoColor,
                                value: videoMute,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      videoMute = value!;
                                    },
                                  );
                                },
                                title: Text(
                                  "Video Muted",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(17.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              OurSizedBox(),
                              CheckboxListTile(
                                activeColor: logoColor,
                                value: audioMute,
                                onChanged: (value) {
                                  setState(
                                    () {
                                      audioMute = value!;
                                    },
                                  );
                                },
                                title: Text(
                                  "Audio Muted",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(17.5),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              OurSizedBox(),
                              //f86f0f
                              OurElevatedButton(
                                title: "Join Meeting",
                                function: () async {
                                  if (controller.text.trim().length == 6) {
                                    print(controller.text);
                                    Get.find<AuthenticationController>()
                                        .toggle(true);
                                    await _joinMeeting(userModel.name);
                                    controller.clear();
                                    Get.find<AuthenticationController>()
                                        .toggle(false);
                                  } else {
                                    print("Doesn't have data");
                                    OurToast().showErrorToast(
                                        "Please enter room code");
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })),
        ));
  }
}
//
// Scaffold(
//         body: 