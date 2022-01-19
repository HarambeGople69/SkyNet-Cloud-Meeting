// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:myapp/services/compress%20image/compress_image.dart';
// import 'package:myapp/widgets/our_flutter_toast.dart';

// class UserProfileUpload {
//   uploadProfile(File file) async {
//     print("Inside uploadProfile");
//     FirebaseStorage firebaseStorage = FirebaseStorage.instance;
//     String downloadUrl = "";
//     try {
//       if (file != null) {
//         File compressedFile = await compressImage(file);
//         String filename = compressedFile.path.split('/').last;
//         final uploadFile = await firebaseStorage
//             .ref(
//                 "${FirebaseAuth.instance.currentUser!.uid}/profile_image/${filename}")
//             .putFile(compressedFile);
//         if (uploadFile.state == TaskState.success) {
//           downloadUrl = await firebaseStorage
//               .ref(
//                   "${FirebaseAuth.instance.currentUser!.uid}/profile_image/${filename}")
//               .getDownloadURL();
//           // UserDetailFirestore().uploadDetail(name, bio, downloadUrl, context);
//         }
//         print("Uploaded=======================");
//       }
//     } catch (e) {
//       OurToast().showErrorToast(e.toString());
//     }
//   }
// }
