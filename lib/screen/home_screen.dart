// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:giaodien/AdsSlideCard.dart';
import 'package:giaodien/news.dart';
import 'package:giaodien/screen/Login_screen.dart';
import 'package:giaodien/screen/discovery_screen.dart';
import 'package:giaodien/screen/map_screen.dart';
import 'package:giaodien/screen/post_form.dart';
import 'package:giaodien/screen/post_screen.dart';
import 'package:giaodien/screen/profile.dart';
import 'package:giaodien/screen/search_screen.dart';
import 'package:giaodien/services/user_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DiscoveryPage(),
    MapScreen(),
    PostScreen(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SBH',
          textAlign: TextAlign.center,
        ),
        actions: [
          // Navigate to the Search Screen
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchScreen())),
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(currentIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5,
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.social_distance_sharp),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            )
          ],
          currentIndex: currentIndex,
          onTap: (val) {
            setState(() {
              currentIndex = val;
            });
          },
        ),
      ),
    );
  }
}
