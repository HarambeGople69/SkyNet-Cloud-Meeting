import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/authentication_controller.dart';
import 'package:myapp/services/firestore/firestore.dart';
import 'package:myapp/widgets/our_flutter_toast.dart';

class Auth {
  createAccount(String email, String password, String name) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Get.find<AuthenticationController>().toggle(false);

        Firestore().addUser(
          FirebaseAuth.instance.currentUser!.uid,
          password,
          email,
          name,
        );

        OurToast().showSuccessToast("User signed successfully");
      });
    } on FirebaseAuthException catch (e) {
      Get.find<AuthenticationController>().toggle(false);

      OurToast().showErrorToast(e.message!);
    }
  }

  loginAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.find<AuthenticationController>().toggle(false);

        OurToast().showSuccessToast("User signed successfully");
      });
    } on FirebaseAuthException catch (e) {
      Get.find<AuthenticationController>().toggle(false);

      OurToast().showErrorToast(e.message!);
    }
  }

  logout() async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        OurToast().showSuccessToast("User logged out successfully");
      });
    } on FirebaseAuthException catch (e) {
      OurToast().showErrorToast(e.message!);
    }
  }
}
