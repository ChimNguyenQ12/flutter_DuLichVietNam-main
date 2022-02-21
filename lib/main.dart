import 'package:flutter/material.dart';
import 'package:giaodien/screen/home_screen.dart';
import 'package:giaodien/screen/loading.dart';
import 'package:giaodien/screen/welcome_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Loading(),
      home: HomePage(),
    );
  }
}
