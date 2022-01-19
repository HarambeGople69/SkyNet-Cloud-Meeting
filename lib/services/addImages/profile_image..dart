import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:myapp/controller/authentication_controller.dart';

class AddProfile {
  Future<void> uploadImage() async {
    Get.find<AuthenticationController>().toggle(true);
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    final picker = ImagePicker();
    XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      return null;
    }
    String filename = pickedImage.name;
    File imageFile = File(pickedImage.path);
    File compressedFiles = await compressImage(imageFile);
    try {
      final uploadTask = await firebaseStorage
          .ref("${FirebaseAuth.instance.currentUser!.uid}/$filename")
          .putFile(compressedFiles);

      if (uploadTask.state == TaskState.success) {
        String downloadUrl = await firebaseStorage
            .ref("${FirebaseAuth.instance.currentUser!.uid}/$filename")
            .getDownloadURL();

        await FirebaseFirestore.instance
            .collection("Users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({
          "imageUrl": downloadUrl,
        }).then((value) {
          print("object");
          Get.find<AuthenticationController>().toggle(false);
        });
        // .add({"url": downloadUrl}).then((value) => print("UtsavUrls"));

        // print("Download Url:::    $downloadUrl");
      } else {}
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }

  Future<File> compressImage(File file) async {
    File compressedFile =
        await FlutterNativeImage.compressImage(file.path, quality: 50);
    print("original size ${file.lengthSync()}");
    print(compressedFile.lengthSync());
    return compressedFile;
  }
}
