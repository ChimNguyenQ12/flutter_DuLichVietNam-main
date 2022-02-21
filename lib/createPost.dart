import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class createPostPages extends StatefulWidget {
  const createPostPages({Key? key}) : super(key: key);
  @override
  _createPostState createState() => _createPostState();
}

class _createPostState extends State<createPostPages> {
  Widget _imageSection() {
    return CircleAvatar(
      radius: 50,
      child: ClipOval(
        child: Image.asset(
          'img/maydapq12.png',
          width: 100.0,
          height: 100.0,
        ),
      ),
    );
  }

  Widget _emailtitle() {
    return Container(
        padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'maydapq12@gmail.com',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ));
  }

  Widget _title() {
    return Container(
        alignment: AlignmentDirectional.topCenter,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Địa danh muốn đăng tải',
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontStyle: FontStyle.normal),
          ),
        ));
  }

  Widget _createPOst() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Tên địa điểm',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Nhập tên địa điểm',
              hintStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Text(
          'Địa chỉ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Nhập địa chỉ',
              hintStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
        Text(
          'Nội dung',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Chi tiết thông tin địa danh',
              hintStyle: TextStyle(color: Colors.blue),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            style: TextStyle(color: Colors.black),
            maxLines: 4,
          ),
        ),
        _Images()
      ],
    );
  }

  Widget _Images() {
    return Container(
      alignment: AlignmentDirectional.topEnd,
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.image_search),
        color: Colors.blue,
      ),
    );
  }

  Widget _theodoiButton() {
    return InkWell(
        onTap: () {},
        child: Container(
          width: 120,
          height: 60,
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                right: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                bottom: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
                top: BorderSide(
                  color: Colors.black,
                  width: 2,
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Color(0xFFE2D2D2)),
          child: TextButton(
            onPressed: () {},
            child: Text(
              ' Đăng bài viết',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D2E9),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            _title(),
            /* Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                _imageSection(),
                SizedBox(height: 20),
                _emailtitle(),
              ],
            ),*/
            SizedBox(
              height: 20,
            ),
            _createPOst(),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: AlignmentDirectional.topCenter,
              child: _theodoiButton(),
            )
          ]),
    );
  }
}
