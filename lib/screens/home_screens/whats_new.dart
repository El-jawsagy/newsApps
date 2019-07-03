import 'package:flutter/material.dart';
import 'package:flutter_app/apis/post_Api.dart';
import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/utilities/shared_Method.dart';

class WhatNew extends StatefulWidget {
  @override
  _WhatNewState createState() => _WhatNewState();
}

PostApi postApi = PostApi();

class _WhatNewState extends State<WhatNew> {
  @override
  Widget build(BuildContext context) {
    TextStyle _titleStyle = TextStyle(
        fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700);

    TextStyle _discriptionStyle = TextStyle(fontSize: 14, color: Colors.white);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _drawContainer(context, _titleStyle, _discriptionStyle),
          _drawerCards(),
          _drawerTextHeader("Recent Updates"),
          _drawerCardsUpdates(),
          Container(
            height: 45,
          )
        ],
      ),
    );
  }

  Widget _drawerTextHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, top: 16, bottom: 16),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }

  Widget _drawerCards() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _drawerTextHeader("Top Stories"),
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 4.0),
          child: Card(
            child: FutureBuilder(
              future: postApi.fetchPost("1"),
              builder: (context, AsyncSnapshot SnapShot) {
                switch (SnapShot.connectionState) {
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
                    if (SnapShot.error != null) {
                      return error(SnapShot.error);
                    } else {
                      if (SnapShot.hasData) {
                        List<post> posts = SnapShot.data;
                        if (posts.length >= 3) {
                          post post1 = SnapShot.data[0];
                          post post2 = SnapShot.data[1];
                          post post3 = SnapShot.data[2];
                          return Column(
                            children: <Widget>[
                              _drawerCard(post1),
                              Container(
                                margin: EdgeInsets.only(top: 8),
                                color: Colors.grey.shade200,
                                height: 1,
                              ),
                              _drawerCard(post2),
                              Container(
                                color: Colors.grey.shade200,
                                height: 1,
                              ),
                              _drawerCard(post3),
                            ],
                          );
                        } else {
                          return noData();
                        }
                      }
                    }
                    break;
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _drawerCard(post Post) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(
                Post.featured_image,
                fit: BoxFit.cover,
                width: 100,
                height: 100,
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
                          Post.title,
                          style: TextStyle(fontSize: 14, height: 1.1),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "hazem el sadeek",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 12),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.timer,
                                  size: 12,
                                ),
                                Text(differentTime(Post.date_written),
                                    style: TextStyle(fontSize: 12))
                              ],
                            ),
                          )
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

  Widget _drawerCardsUpdates() {
    return  FutureBuilder(future: postApi.fetchPost("2"),
        builder: (context , AsyncSnapshot snapshot ){
          switch(snapshot.connectionState){
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
              if(snapshot.error != null){
                //todo: handle error
              }else{
                if(snapshot.hasData){
                  List<post> posts = snapshot.data;
                  if(posts.length >= 2){return
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[



                      _drawerCardsUpdate(
                          Colors.red, posts[1],"history"),
                      _drawerCardsUpdate(Colors.greenAccent,
                          posts[2],"sport"),
                    ],
                  );

                }
              }}
              break;

          }
        });
  }

  Widget _drawerCardsUpdate(Color color,post post,String category) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(right: 4.0, left: 4.0, top: 4),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      image: NetworkImage(post.featured_image),
                      fit: BoxFit.cover)),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8, bottom: 8),
                child: Container(
                  child: Text(
                    category,
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0), color: color),
                ),
              ),
            ),
            Text(
              post.content,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.timer,
                    size: 12,
                  ),
                  Container(
                    width: 4,
                  ),
                  Text(
                    differentTime(post.date_written),
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _drawContainer(
    BuildContext context, TextStyle _titleStyle, TextStyle _descriptionStyle) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * .25,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: ExactAssetImage("assets/images/BackGround.png"),
            fit: BoxFit.cover)),
    child: Padding(
      padding: const EdgeInsets.only(left: 48, right: 48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "How Terriers & Royals Gatecrashed Final ",
            style: _titleStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            "lorem ipsum dolor sit amet. consectetur adipisicing elit. sed do eiusmod",
            style: _descriptionStyle,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}
