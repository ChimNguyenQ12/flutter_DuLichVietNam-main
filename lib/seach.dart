import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeachPages extends StatefulWidget {
  const SeachPages({Key? key}) : super(key: key);
  @override
  _SeachState createState() => _SeachState();
}

class _SeachState extends State<SeachPages> {
  Widget _Seach() {
    return AppBar(
      title: TextField(
        decoration: InputDecoration(
            hintText: 'Nhập địa danh cần tìm...',
            border: InputBorder.none,
            icon: IconButton(onPressed: () {}, icon: Icon(Icons.search))),
      ),
    );
  }

  Widget _List() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Tìm kiếm nâng cao'),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
          ),
          hint: Text('Địa danh'),
          items: <String>[
            'vịnh Hạ Long ',
            'Phố cổ Hội An',
            'Hang Sơn Đòong',
            'Núi Bà Đen',
            'Đảo Phú Quốc',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
          ),
          hint: Text('Phổ biến'),
          items: <String>[
            'Miền Bắc ',
            'Miền Nam',
            'Miền Trung',
            'Đông Bắc',
            'Đông Namc',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
          ),
          hint: Text('Loại hình'),
          items: <String>[
            'Villa  ',
            'Khách sạn 5 sao',
            'Khách sạn 4 sao',
            'HomeStay',
            'Nhà nghỉ',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
          ),
          hint: Text('Vùng miền'),
          items: <String>[
            'Nhiều người xem  ',
            'Xu hướng 2022',
            'Địa điểm lạ',
            'Địa điểm mới nổi',
            'Combo cả gia đình',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
          ),
          hint: Text('Đánh Giá'),
          items: <String>[
            'Đánh giá cao nhất',
            'Đánh giá thấp nhất',
            'Lượt đề xuất cao',
            'Lượt check in cao',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        ),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person),
          ),
          hint: Text('Khu vực'),
          items: <String>[
            'Trung tâm thành phố',
            'Chợ, quán ăn...',
            'Chợ, quán ăn...',
            'Cảnh đẹp',
            'An ninh, trật tự',
          ].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          }).toList(),
          onChanged: (_) {},
        )
      ],
    );
  }

  Widget _button() {
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {},
          child: Text('Xoá hết'),
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {},
          child: Text('Tìm'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFD9D2E9),
        body: Column(
          children: [
            Container(
              width: 700,
              height: 50,
              child: _Seach(),
            ),
            Container(
              width: 700,
              height: 500,
              child: _List(),
            ),
            SizedBox(
              height: 10,
            ),
            _button()
          ],
        ));
  }
}
