import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class repairPages extends StatefulWidget {
  @override
  _repairPagesState createState() => _repairPagesState();
}

class _repairPagesState extends State<repairPages> {
  Widget _imageSection() {
    return CircleAvatar(
      radius: 80,
      child: ClipOval(
        child: Image.asset(
          'img/maydapq12.png',
          width: 600.0,
          height: 600.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFFD9D2E9),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFD9D2E9), Color(0xff8E7CC3)])),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: _backButton(),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                _imageSection(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt),
                ),
              ],
            ),
            Text(
              'Họ và tên ',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
            _entryFieldEmail(),
            Text(
              'Giới thiệu',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            TextField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    fillColor: Color(0xfff3f3f4),
                    filled: true)),
            SizedBox(height: 20),
            _submitButton(),
          ],
        )),
      ),
    );
  }
}

Widget _entryFieldEmail() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          controller: _mailController,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorText: _mailInvalid ? _mailErr : null,
              border: InputBorder.none,
              fillColor: Color(0xfff3f3f4),
              filled: true),
        ),
      ],
    ),
  );
}

Widget _submitButton() {
  return InkWell(
    onTap: () {},
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.grey.shade200, spreadRadius: 1)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0xFFD9D2E9), Color(0xff8E7CC3)])),
      child: Text(
        'Cập nhật',
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

TextEditingController _mailController = new TextEditingController();
var _mailInvalid = false;
var _mailErr = 'Invalid email. Try again';
