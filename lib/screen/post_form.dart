import 'dart:io';
import 'dart:math';
import 'package:giaodien/models/places.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:giaodien/constant.dart';
import 'package:giaodien/models/api_response.dart';
import 'package:giaodien/models/post.dart';
import 'package:giaodien/screen/Login_screen.dart';
import 'package:giaodien/services/place_service.dart';
import 'package:giaodien/services/post_service.dart';
import 'package:giaodien/services/user_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:select_form_field/select_form_field.dart';

class PostForm extends StatefulWidget {
  final Post? post;
  final String? title;
  final Place? place;
  PostForm({this.post, this.title, this.place});
  @override
  _PostFormState createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController txtControllerBody = new TextEditingController();
  TextEditingController txtControllerplace = new TextEditingController();
  bool _loading = false;
  File? _imagefile;
  final _picker = ImagePicker();
  int userID = 0;

  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imagefile = File(pickedFile.path);
      });
    }
  }

  List<dynamic> _placeslist = [];
//get all places
  Future<void> retrievePlaces() async {
    userID = await getUserId();
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

  int placeid = 1;
  //create post
  void _createPost() async {
    String? image = _imagefile == null ? null : getStringImage(_imagefile);
    ApiResponse response =
        await createPost(placeid, txtControllerBody.text, image);

    if (response.error == null) {
      Navigator.pop(context);
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      setState(() {
        _loading = !_loading;
      });
    }
  }

  //edit post
  void _editPost(int postId) async {
    ApiResponse response = await editPost(postId, txtControllerBody.text);

    if (response.error == null) {
      Navigator.pop(context);
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginPage()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
      setState(() {
        _loading = !_loading;
      });
    }
  }

  @override
  void initState() {
    if (widget.post != null) {
      txtControllerBody.text = widget.post!.body ?? '';
    }
    if (widget.place != null) {
      txtControllerplace.text = widget.place!.name ?? '';
      placeid = widget.place!.id ?? 0;
    }

    super.initState();
    retrievePlaces();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
      ),
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                widget.post != null
                    ? SizedBox()
                    : Container(
                        width: MediaQuery.of(context).size.height,
                        height: 200,
                        decoration: BoxDecoration(
                            image: _imagefile == null
                                ? null
                                : DecorationImage(
                                    image: FileImage(_imagefile ?? File('')),
                                    fit: BoxFit.cover)),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                getImage();
                              },
                              icon: Icon(
                                Icons.image,
                                size: 50,
                                color: Colors.black38,
                              )),
                        ),
                      ),
                widget.place == null
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          enabled: false,
                          controller: txtControllerplace,
                          decoration: InputDecoration(
                            hintText: "Place",
                            border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black38),
                            ),
                          ),
                        ),
                      ),
                Form(
                  key: formkey,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: TextFormField(
                      controller: txtControllerBody,
                      keyboardType: TextInputType.multiline,
                      maxLines: 9,
                      validator: (val) =>
                          val!.isEmpty ? 'Post body is required' : null,
                      decoration: InputDecoration(
                        hintText: placeid.toString(),
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.black38),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: kTextButton(
                    'Post',
                    () {
                      if (formkey.currentState!.validate()) {
                        setState(() {
                          _loading = !_loading;
                        });
                        if (widget.post == null) {
                          _createPost();
                        } else {
                          _editPost(widget.post!.id ?? 0);
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
