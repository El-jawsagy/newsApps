import 'package:flutter/material.dart';
import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/utilities/shared_Method.dart';

class SinglePost extends StatefulWidget {
  post posts = post();

  SinglePost(this.posts);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            floating: true,
            pinned: true,
            flexibleSpace: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.posts.featured_image),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, position) {
              if (position == 0) {
                return _drawContent(widget.posts);
              } else if (position >= 2 && position < 22) {
                return _drawComment(widget.posts);
              } else if (position == 1) {
                return _drawerTextHeader("Comments :");
              } else if (position == 22) {
                return _drawAddComment();
              }
            }, childCount: 23),
          ),
        ],
      ),
    );
  }

//  Widget _drawColumnAppBar(post posts) {
//    return Column(
//      crossAxisAlignment: CrossAxisAlignment.start,
//      children: <Widget>[
//        Row(
//          children: <Widget>[
//            CircleAvatar(
//              backgroundImage: ExactAssetImage("assets/images/BackGround.png"),
//            )
//          ],
//        )
//      ],
//    );
//  }

  Widget _drawContent(post posts) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        posts.content,
        style: TextStyle(fontSize: 20, height: 1.25, letterSpacing: 1.2),
      ),
    );
  }

  Widget _drawComment(post posts) {
    TextStyle textStyle = TextStyle(color: Colors.grey.shade600);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                  backgroundImage:
                      ExactAssetImage("assets/images/BackGround.png"),
                  radius: 20,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Mahmoud Ragab",
                        style: textStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.timer,
                        size: 16,
                        color: Colors.cyan,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        differentTime(posts.date_written),
                        style: textStyle,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            height: MediaQuery.of(context).size.height * .18,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Center(
                child: Text(
              posts.title,
              style: TextStyle(fontSize: 12),
            ))),
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _drawerTextHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        top: 16,
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.grey.shade900, fontSize: 24),
      ),
    );
  }

  Widget _drawAddComment() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),color: Colors.grey.shade200),
        child: Row(
          children: <Widget>[
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Enter your comment'),
                ),
              ),
              fit: FlexFit.loose,
            ),
            FlatButton(onPressed: (){}, child: Text("SEND",style: TextStyle(color: Colors.orange),))
          ],
        ),
      ),
    );
  }
}
