import 'package:flutter/material.dart';
import 'package:giaodien/constant.dart';
import 'package:giaodien/models/api_response.dart';
import 'package:giaodien/models/places.dart';
import 'package:giaodien/models/post.dart';
import 'package:giaodien/screen/Dia_Danh.dart';
import 'package:giaodien/screen/Login_screen.dart';
import 'package:giaodien/screen/chitiet_tienich.dart';
import 'package:giaodien/services/place_service.dart';
import 'package:giaodien/services/post_service.dart';
import 'package:giaodien/services/user_service.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({Key? key}) : super(key: key);

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  List<dynamic> _placeslist = [];
  int userID = 0;
  bool _loading = false;

//get all post
  Future<void> retrievePlaces() async {
    ApiResponse response = await getPlaces();

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

  @override
  void initState() {
    retrievePlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return retrievePlaces();
      },
      child: ListView.builder(
          itemCount: _placeslist.length,
          itemBuilder: (BuildContext context, int index) {
            Place place = _placeslist[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ChiTietTienIch(
                              placeID: place.id,
                            )));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      padding: EdgeInsets.only(right: 5, left: 5),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: double.infinity,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${place.name}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 25),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    place.image != null
                        ? Container(
                            width: MediaQuery.of(context).size.height,
                            height: 180,
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage('${place.image}'),
                                    fit: BoxFit.cover)),
                          )
                        : SizedBox(
                            height: place.image != null ? 0 : 10,
                          ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
