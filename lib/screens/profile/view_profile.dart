import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:myapp/controller/authentication_controller.dart';
import 'package:myapp/models/usermodel.dart';
import 'package:myapp/services/addImages/profile_image..dart';
import 'package:myapp/services/authentication/authentication.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/widgets/our_elevated_button.dart';
import 'package:myapp/widgets/our_list_tile.dart';
import 'package:myapp/widgets/our_sized_box.dart';

class ViewProfilePage extends StatefulWidget {
  const ViewProfilePage({Key? key}) : super(key: key);

  @override
  _ViewProfilePageState createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ModalProgressHUD(
          inAsyncCall: Get.find<AuthenticationController>().processing.value,
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

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipPath(
                          clipper: OvalBottomBorderClipper(),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 2.5,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  logoColor,
                                  lightlogoColor,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -40,
                          left: MediaQuery.of(context).size.width / 3.2,
                          // left: 0,
                          // right: 0,
                          child: InkWell(
                            onTap: () {
                              // print("Profile pressed");
                              AddProfile().uploadImage();
                            },
                            child: Container(
                              height: ScreenUtil().setSp(125),
                              width: ScreenUtil().setSp(125),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: userModel.imageUrl == ""
                                  ? Image.asset(
                                      "assets/images/profileplaceholder.png",
                                      fit: BoxFit.cover,
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        ScreenUtil().setSp(100),
                                      ),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: userModel.imageUrl,
                                        placeholder: (context, url) =>
                                            Image.asset(
                                          "assets/images/profileplaceholder.png",
                                          height: ScreenUtil().setSp(125),
                                          width: ScreenUtil().setSp(125),
                                        ),
                                      ),
                                    ),
                              // : Text(
                              //     userModel.imageUrl,
                              //   ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: ScreenUtil().setSp(70),
                    ),
                    OurListTile(
                      title: "User name:",
                      value: userModel.name,
                    ),
                    OurListTile(
                      title: "Email:",
                      value: userModel.email,
                    ),
                    OurListTile(
                      title: "Added on:",
                      value: userModel.AddedOn,
                    ),
                    OurSizedBox(),
                    Center(
                      child: OurElevatedButton(
                        title: "Logout",
                        function: () {
                          Auth().logout();
                        },
                      ),
                    )
                  ],
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
