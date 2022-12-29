

import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileData {
  final String name;
  final String userName;
  final String email;
  final String password;
  final Timestamp birthday;
  final String imagePersonUrl;
  const ProfileData(
      {
        required this.name,
        required this.userName,
        required this.email,
        required this.password,
        required this.birthday,
        required this.imagePersonUrl});
}
