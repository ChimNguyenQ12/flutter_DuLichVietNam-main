import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:giaodien/PostObject.dart';

class PostProvider {
  static List<PostObject> parsePost(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PostObject>((e) => PostObject.fromJson(e)).toList();
  }

  static Future<List<PostObject>> fecthPost() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/BaiViet'));
    return parsePost(response.body);
  }

  static Future<PostObject> fecthPostbyID(int id) async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/BaiViet/$id'));
    return PostObject.fromJson(jsonDecode(response.body));
  }
}
