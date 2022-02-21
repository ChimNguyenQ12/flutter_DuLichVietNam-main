import 'package:giaodien/models/post.dart';
import 'package:giaodien/models/user.dart';

class Place {
  int? id;
  String? name;
  String? body;
  String? image;
  int? likesCount;
  bool? selfLiked;
  int? marksCount;
  bool? selfMarked;
  int? place_type;
  User? user;
  Place({
    this.id,
    this.name,
    this.body,
    this.image,
    this.place_type,
    this.user,
    this.likesCount,
    this.selfLiked,
    this.marksCount,
    this.selfMarked,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      body: json['body'],
      likesCount: json['likes_count'],
      selfLiked: json['likes'].length > 0,
      marksCount: json['marks_count'],
      selfMarked: json['marks'].length > 0,
      image: json['image'],
      place_type: json['place_type'],
      // user: User(
      //   id: json['user']['id'],
      //   name: json['user']['name'],
      // ),
    );
  }
}
