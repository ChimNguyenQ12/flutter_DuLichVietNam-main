import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sendPOstPages extends StatefulWidget {
  const sendPOstPages({Key? key}) : super(key: key);
  @override
  _sendPostState createState() => _sendPostState();
}

class _sendPostState extends State<sendPOstPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD9D2E9),
      appBar: AppBar(
        backgroundColor: Color(0xFFD9D2E9),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gửi đề xuất',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Họ và tên người gửi',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
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
                      filled: true))),
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: _entryFieldEmail()),
          Text(
            'Thông tin địa danh',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
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
                      filled: true))),
          Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.image),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: _submitButton(),
          )
        ],
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
        'Gửi đề xuất',
        style: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

TextEditingController _mailController = new TextEditingController();
var _mailInvalid = false;
var _mailErr = 'Invalid email. Try again';
