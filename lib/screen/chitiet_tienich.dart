import 'dart:io';

import 'package:flutter/material.dart';
import 'package:giaodien/constant.dart';
import 'package:giaodien/models/api_response.dart';
import 'package:giaodien/models/dish.dart';
import 'package:giaodien/models/places.dart';
import 'package:giaodien/screen/Login_screen.dart';
import 'package:giaodien/screen/post_form.dart';
import 'package:giaodien/services/dish_service.dart';
import 'package:giaodien/services/place_service.dart';
import 'package:giaodien/services/user_service.dart';
import 'package:image_picker/image_picker.dart';

class ChiTietTienIch extends StatefulWidget {
  final int? placeID;

  ChiTietTienIch({this.placeID});

  @override
  _ChiTietTienIchState createState() => _ChiTietTienIchState();
}

class _ChiTietTienIchState extends State<ChiTietTienIch> {
  File? _imagefile;
  final _picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagefile = File(pickedFile.path);
      });
    }
  }

  int userID = 0;
  bool _loading = false;
  List<dynamic> _placeslist = [];
//get  place
  Future<void> retrievePlaces() async {
    userID = await getUserId();
    ApiResponse response = await getOnePlace(widget.placeID ?? 0);

    if (response.error == null) {
      setState(() {
        _placeslist = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  //get  dishes
  List<dynamic> _dishlist = [];
  Future<void> retrieveDish() async {
    userID = await getUserId();
    ApiResponse response = await getDishes(widget.placeID ?? 0);

    if (response.error == null) {
      setState(() {
        _dishlist = response.data as List<dynamic>;
        _loading = _loading ? !_loading : _loading;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  //mark place
  void _handlePlaceMark(int placeid) async {
    ApiResponse response = await markUnmarkPlace(placeid);
    if (response.error == null) {
      retrievePlaces();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

//like place
  void _handlePlaceLike(int placeid) async {
    ApiResponse response = await likeorUnlikePlace(placeid);
    if (response.error == null) {
      retrievePlaces();
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    super.initState();
    retrieveDish();
    retrievePlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemCount: _placeslist.length,
          itemBuilder: (BuildContext context, int index) {
            Place place = _placeslist[index];
            return Container(
              padding: EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      image: DecorationImage(
                        image: NetworkImage('${place.image}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.home,
                                color: Color(0xFF7D82BC),
                                size: 33,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${place.name}',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Color(0xFF7D82BC)),
                            SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Hong có địa chỉ đâu bé ơi',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.description, color: Color(0xFF7D82BC)),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Mô tả',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Expanded(
                                child: Text(
                                  '${place.body}',
                                  softWrap: true,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //3 buttons mark + like + feedbacks
                                Expanded(
                                  child: Material(
                                    child: InkWell(
                                      onTap: () =>
                                          _handlePlaceLike(place.id ?? 0),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              place.selfLiked == true
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_rounded,
                                              size: 20,
                                              color: place.selfLiked == true
                                                  ? Colors.red
                                                  : Colors.black54,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              place.likesCount.toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Material(
                                    child: InkWell(
                                      onTap: () =>
                                          _handlePlaceMark(place.id ?? 0),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              place.selfMarked == true
                                                  ? Icons.note
                                                  : Icons.note_add_outlined,
                                              size: 20,
                                              color: place.selfMarked == true
                                                  ? Colors.red
                                                  : Colors.black54,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              place.selfMarked == false
                                                  ? 'Unmarked'
                                                  : 'Marked',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),

                                Expanded(
                                  child: Material(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) => PostForm(
                                                      title:
                                                          'Thêm bài viết mới',
                                                      place: place,
                                                    )));
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 4),
                                            Text(
                                              'Shared',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Các quán ăn ở đây',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Các bài viết liên quan',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
