// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:giaodien/news.dart';
import 'package:giaodien/screen/Login_screen.dart';
import 'package:giaodien/screen/post_form.dart';
import 'package:giaodien/screen/post_screen.dart';
import 'package:giaodien/screen/profile.dart';
import 'package:giaodien/screen/user_profile_edit.dart';
import 'package:giaodien/services/user_service.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ProfileEdit(),
    );
  }
}
