import 'package:giaodien/models/places.dart';
import 'package:giaodien/models/user.dart';

class Post {
  int? id;
  String? body;
  String? image;
  int? likesCount;
  int? commentsCount;
  int? place_id;
  User? user;
  bool? selfLiked;
  Place? place;
  Post({
    this.id,
    this.body,
    this.image,
    this.likesCount,
    this.commentsCount,
    this.user,
    this.selfLiked,
    this.place,
    this.place_id,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      body: json['body'],
      image: json['image'],
      place_id: json['plage_id'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      selfLiked: json['likes'].length > 0,
      user: User(
          id: json['user']['id'],
          name: json['user']['name'],
          image: json['user']['image']),
      place: Place(
        id: json['id'],
        name: json['name'],
      ),
    );
  }
}
