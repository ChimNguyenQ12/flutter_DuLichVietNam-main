import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiaDanhPages extends StatefulWidget {
  const DiaDanhPages({Key? key}) : super(key: key);
  @override
  _DiaDanhState createState() => _DiaDanhState();
}

class _DiaDanhState extends State<DiaDanhPages> {
  final item = ['Item1', 'Item2', 'Item3', 'Item4', 'Item5'];
  String? value;
  @override
  Widget build(BuildContext context) {
    Widget _Tieude() {
      return AppBar(
        backgroundColor: Color(0xFFD9D2E9),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Địa danh'),
            IconButton(onPressed: () {}, icon: Icon(Icons.search))
          ],
        ),
      );
    }

    Widget _DropDownBoutton() {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.person),
        ),
        hint: Text('Chọn địa điểm'),
        items: <String>[
          'Hạ Long ',
          'Hội An',
          'Quảng Bình',
          'Đà Nẵng',
          'Vũng tàu',
          'Nha Trang',
          'Huế',
          'Đà Lạt',
          'Phú Quốc',
          'Sapa',
          'Mộc Châu'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFD9D2E9),
      body: Column(
        children: [
          _Tieude(),
          SizedBox(height: 20),
          Container(
            width: 200,
            height: 70,
            child: _DropDownBoutton(),
          )
        ],
      ),
    );
  }
}
