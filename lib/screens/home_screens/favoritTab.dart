import 'package:flutter/material.dart';
import 'package:flutter_app/apis/post_Api.dart';
import 'package:flutter_app/models/authers.dart';
import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/utilities/shared_Method.dart';

class FavoriteTab extends StatefulWidget {
  @override
  _FavoriteTabState createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  PostApi postApi = PostApi();
  Future<List<author>> authors;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: postApi.fetchPost("3"),
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
                    itemBuilder: (context, position) {
                      return Card(
                          child:
                              _drawerCards("hazam el-sadeek", posts[position]));
                    },
                    itemCount: posts.length,
                  );
                } else {
                  return noData();
                }
              }
              break;
          }
        });
  }

  Widget _drawerCards(String customer, post posts) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(
                        image: NetworkImage(posts.featured_image),
                        fit: BoxFit.cover)),
                width: 125,
                height: 125,
                margin: EdgeInsets.only(left: 8),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 54.0),
                        child: Text(
                          posts.content,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            splashColor: Colors.red.shade800,
                            icon: Icon(Icons.favorite_border),
                            onPressed: () {}),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            customer,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                size: 12,
                              ),
                              Text(differentTime(posts.date_written),
                                  style: TextStyle(fontSize: 12))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
