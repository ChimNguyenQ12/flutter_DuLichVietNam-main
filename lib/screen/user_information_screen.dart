import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:giaodien/screen/home_screen.dart';
import 'package:giaodien/models/api_response.dart';
import 'package:giaodien/screen/Login_screen.dart';
import 'package:giaodien/repair_user_information.dart';
import 'package:giaodien/services/user_service.dart';

class userInformationScreen extends StatefulWidget {
  @override
  _userInformationScreenState createState() => _userInformationScreenState();
}

class _userInformationScreenState extends State<userInformationScreen> {
  Widget _imageSection() {
    return CircleAvatar(
      radius: 120,
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

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Máy Dập Quận 12',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xffEEEEEE)),
      ),
    );
  }

  Widget _email_phonetitle() {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'maydapq12@gmail.com',
            style: TextStyle(fontSize: 15, color: Color(0xffEEEEEE)),
          ),
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: '0969696969669',
            style: TextStyle(fontSize: 15, color: Color(0xffEEEEEE)),
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return IntrinsicHeight(
        child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '     30\n' 'Bài Viết',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        VerticalDivider(
          color: Colors.black,
          thickness: 3,
        ),
        Text(
          '     15\n'
          'Địa Danh',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        VerticalDivider(
          color: Colors.black,
          thickness: 3,
        ),
        Text(
          '     30\n' 'Followers',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ],
    ));
  }

  Widget _introductionText() {
    return Row(
      children: [
        Text(
          'Giới Thiệu',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ],
    );
  }

  Widget _introduction = Padding(
    padding: EdgeInsets.all(15),
    child: Text(
      'Lake Oeschinen lies at the foot of the Bluemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing and riding the summer toboggan run',
      style: TextStyle(fontSize: 15, color: Colors.black),
      softWrap: true,
    ),
  );
  Widget _theodoiButton() {
    return InkWell(
        onTap: () {},
        child: Container(
          width: 120,
          height: 50,
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => repairPages(),
                  ));
            },
            child: Text(
              ' Chỉnh sửa',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
        ));
  }

  Widget _post() {
    return ListTile(
      textColor: Colors.black,
      title: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: ClipOval(
                      child: Image.asset(
                        'img/maydapq12.png',
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Đào Đức Tính',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Tính đang ở Quận 12'),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '12:03 26/12/2021',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_horiz),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset('img/hoian.jpg'),
              ),
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: _likeClick,
                      icon:
                          Icon(_like ? Icons.favorite : Icons.favorite_border),
                      color: Colors.pink[100],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '300',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Bình luận bài viết ở đây.....',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Divider(
              thickness: 2,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }

  bool _like = false;
  void _likeClick() {
    setState(() {
      _like = !_like;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              _imageSection(),
              SizedBox(height: 20),
              _title(),
              SizedBox(height: 10),
              _email_phonetitle(),
              SizedBox(height: 20),
              _theodoiButton(),
              SizedBox(height: 20),
              _divider(),
              SizedBox(
                height: 40,
              ),
              _introductionText(),
              _introduction,
              _post(),
            ],
          ),
        ),
      ),
    );
  }
}
