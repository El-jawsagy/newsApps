import 'package:flutter/material.dart';
import 'package:flutter_app/apis/post_Api.dart';
import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/shared_ui/drawerNavigation.dart';
import 'package:flutter_app/utilities/shared_Method.dart';

class twitterFeeds extends StatefulWidget {
  @override
  _twitterFeedsState createState() => _twitterFeedsState();
}

PostApi postApi = PostApi();
List<int> ids = [];
List<int> bool =[];


class _twitterFeedsState extends State<twitterFeeds> {
  @override
  void initState() {
    super.initState();
    ids = [2, 5, 3];
    bool =[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feeds"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      drawer: DrawerNavigation(),
      body: FutureBuilder(
        future: postApi.fetchPost("1"),
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
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
              if (snapShot.hasError) {
                return error(snapShot.error);
              } else {
                if (snapShot.hasData) {
                  List<post> posts = snapShot.data;
                  return ListView.builder(
                    padding: EdgeInsets.all(8.0),
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 16.0,
                              right: 16,
                            ),
                            child: Column(
                              children: <Widget>[
                                _rowTitle(),
                                _rowCenter(posts[position]),
                                _drawLine(),
                                _rowBottom(posts[position], ids),
                              ],
                            ),
                          ),
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
      ),
    );
  }

  Widget _rowTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
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
                    Text(
                      "@OudaRagab",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                    )
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Fri,12 May 2017 - 14.30",
                    style: TextStyle(color: Colors.grey.shade500),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _rowBottom(post tempPost, List<int> ids) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: (ids.contains(tempPost.id))
                      ? Colors.orange
                      : Colors.grey.shade500,
                ),
                onPressed: () {
                  if (ids.contains(tempPost.id)) {
                    ids.remove(tempPost.id);
                  } else {
                    ids.add(tempPost.id);
                  }
                  setState(() {});
                }),
            Text(
              "25",
              style: TextStyle(color: Colors.grey.shade700),
            )
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Text("SHARE"),
              textColor: Colors.amber.shade700,
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                "OPEN",
              ),
              textColor: Colors.amber.shade700,
            )
          ],
        )
      ],
    );
  }

  Widget _rowCenter(post tempPost) {
    String tempString = tempPost.content.substring(0, 78);
    String readMore = "...Read More";
    String ReadLess ="...Read Less";
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Wrap(
        children: <Widget>[
          Text(
            (bool.contains(tempPost.id)) ? tempPost.content:tempString,
            style: TextStyle(
              wordSpacing: 1.25,
              fontSize: 16,
              height: 1.2,
            ),
          ),
          InkWell(
              onTap: () {

                if (bool.contains(tempPost.id)) {
                  bool.remove(tempPost.id);
                  ;
                } else {
                  bool.add(tempPost.id);
                  ;
                }
                setState(() {

                });



              },
              child: Text(
                (bool.contains(tempPost.id)?ReadLess:readMore),
                style: TextStyle(color: Colors.cyan),
              )),
        ],
      ),
    );
  }

  Widget _drawLine() {
    return Container(
      color: Colors.grey.shade200,
      height: 1,
    );
  }
}
