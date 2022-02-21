import 'package:flutter/material.dart';
import 'package:giaodien/PostObject.dart';
import 'package:giaodien/PostProvider.dart';

class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  _NewsFeedState createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<PostObject>>(
        future: PostProvider.fecthPost(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Có lỗi xảy ra'),
            );
          } else if (snapshot.hasData) {
            return PostList(lstPost: snapshot.data!);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class PostList extends StatelessWidget {
  final List<PostObject> lstPost;
  const PostList({Key? key, required this.lstPost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: ListView.builder(
        itemBuilder: (context, index) => Card(
          color: Colors.white60,
          child: Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text(
                    lstPost[index].idnguoidung.toString(),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(lstPost[index].idnguoidung.toString(),
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        Text(lstPost[index].iddiadanh.toString(),
                            style: TextStyle(
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  lstPost[index].NoiDung,
                  softWrap: true,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset('img/hoian.jpg'),
                        ListTile(
                            leading: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.pink[300],
                              ),
                            ),
                            title: Text(
                              '3000',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        itemCount: lstPost.length,
      ),
    );
  }
}

