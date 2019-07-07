import 'package:flutter/material.dart';
import 'package:flutter_app/apis/post_Api.dart';
import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/shared_ui/drawerNavigation.dart';
import 'package:flutter_app/utilities/shared_Method.dart';

class InstagramFeeds extends StatefulWidget {
  @override
  _InstagramFeedsState createState() => _InstagramFeedsState();
}

List<int> ids = [];
PostApi postApi = PostApi();
List<post> posts = List<post>();

class _InstagramFeedsState extends State<InstagramFeeds> {
  TextStyle _HasAndbuttomStyle = TextStyle(
    color: Colors.orange,
    fontSize: 10,
  );

  @override
  void initState() {
    super.initState();
    ids = [2, 7, 10];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Instgram Feeds"),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
          ],
        ),
        drawer: DrawerNavigation(),
        body:FutureBuilder(
              future: postApi.fetchPost("3"),
              builder: (context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return connectionError();
                    break;
                  case ConnectionState.waiting:
                    return loading();
                    break;
                  case ConnectionState.active:
                    return loading();
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return error(snapshot.error);
                    } else {
                      if (snapshot.hasData) {
                        List<post> post0 = snapshot.data;
                        posts =post0;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.all(4),
                          itemBuilder: (context, position) {
                            return Card(
                              child: Column(
                                children: <Widget>[
                                  _rowTitle(position, ids, posts[position]),
                                  _rowCenter(posts[position]),
                                  _rowButtom(),
                                ],
                              ),
                            );
                          },
                          itemCount: posts.length,
                        );
                      } else {
                        return noData();
                      }
                    }
                    break;
                }
              },
            )
    );
  }

  Widget _rowTitle(int position, List<int> ids, post Post) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: CircleAvatar(
                    backgroundImage:
                        ExactAssetImage("assets/images/BackGround.png"),
                    radius: 20,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0),
                          child: Text(
                            "Mahmoud Ragab",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        color: Colors.cyan,
                      ),
                      Text(
                        differentTime(Post.date_written),
                        style: TextStyle(color: Colors.grey.shade500),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: (ids.contains(position))
                      ? Colors.red
                      : Colors.grey.shade500,
                ),
                onPressed: () {
                  if (ids.contains(position)) {
                    ids.remove(position);
                  } else {
                    print(ids);
                    ids.add(position);
                  }
                  setState(() {});
                },
                iconSize: 25,
              ),
              Transform.translate(
                child: Text(
                  "25",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                offset: Offset(-12, 0),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _rowCenter(post post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 16.0, right: 8, top: 8, bottom: 8),
          child: Text(post.title),
        ),
        Wrap(
          children: <Widget>[
            Container(
              child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {},
                  child: Text(
                    "#Advance",
                    style: _HasAndbuttomStyle,
                  )),
            ),
            FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {},
                child: Text(
                  "#Advance",
                  style: _HasAndbuttomStyle,
                )),
            FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () {},
                child: Text(
                  "#Advance",
                  style: _HasAndbuttomStyle,
                )),
          ],
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * .40,
            width: double.infinity,
            child: Image.network(post.featured_image),)
      ],
    );
  }

  Widget _rowButtom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      "10",
                      style: _HasAndbuttomStyle,
                    ),
                    Container(
                      width: 2,
                    ),
                    Text(
                      "Comment",
                      style: _HasAndbuttomStyle,
                    )
                  ],
                )),
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text(
                  "SHARE",
                  style: _HasAndbuttomStyle,
                )),
            FlatButton(
                onPressed: () {},
                child: Text(
                  "OPEN",
                  style: _HasAndbuttomStyle,
                )),
          ],
        )
      ],
    );
  }
}
