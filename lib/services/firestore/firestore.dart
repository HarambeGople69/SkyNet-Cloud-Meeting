import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Firestore {
  addUser(String uid,String password, String email, String name) async {
    try {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(uid)
          .collection("User Detail")
          .add({
        "email": email,
        "name": name,
        "AddedOn": DateFormat('yyy-MM--dd').format(
          DateTime.now(),
        ),
        "password":password,
      }).then((value) => print("Done =========================="));
    } catch (e) {
      print(e);
    }
  }


}
