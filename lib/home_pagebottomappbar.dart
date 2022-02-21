import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:giaodien/screen/Dia_Danh.dart';
import 'package:giaodien/screen/Register_screen.dart';
import 'package:giaodien/createPost.dart';
import 'package:giaodien/screen/home_screen.dart';
import 'package:giaodien/seach.dart';
import 'package:giaodien/sendPost.dart';
import 'package:giaodien/screen/user_information_screen.dart';

import 'screen/Login_screen.dart';

class home_pagebottomappbar extends StatefulWidget {
  const home_pagebottomappbar({Key? key}) : super(key: key);

  @override
  _home_pagebottomappbarState createState() => _home_pagebottomappbarState();
}

class _home_pagebottomappbarState extends State<home_pagebottomappbar> {
  int selectedPage = 0;
  final _pageOption = [
    HomePage(),
    createPostPages(),
    sendPOstPages(),
    //userInformationScreen(),
    SeachPages()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pageOption[selectedPage],
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(icon: Icons.home, title: 'Trang Chủ'),
            TabItem(icon: Icons.upload, title: 'Đăng Bài'),
            TabItem(icon: Icons.mail, title: 'Góp Ý'),
            TabItem(icon: Icons.person_outline, title: 'Tài Khoản'),
          ],
          initialActiveIndex: selectedPage, //optional, default as 0
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          },
          backgroundColor: Color(0xFFD9D2E9),
          color: Colors.black,
          activeColor: Colors.blueAccent,
        ));
  }
}
