import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String name;
  final String AddedOn;
  final String imageUrl;

  UserModel( {
    required this.email,
    required this.name,
    required this.AddedOn,
    required this.imageUrl,
  });

  factory UserModel.fromJson(Map<dynamic,dynamic> querySnapshot) {
    return UserModel(
      email: querySnapshot["email"],
      name: querySnapshot["name"],
      AddedOn: querySnapshot["AddedOn"],
      imageUrl: querySnapshot["imageUrl"],

    );
  }
}
