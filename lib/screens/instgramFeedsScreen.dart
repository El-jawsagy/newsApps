import 'package:flutter/material.dart';
import 'package:flutter_app/shared_ui/drawerNavigation.dart';

class InstagramFeeds extends StatefulWidget {
  @override
  _InstagramFeedsState createState() => _InstagramFeedsState();
}

class _InstagramFeedsState extends State<InstagramFeeds> {
  TextStyle _HasAndbuttomStyle = TextStyle(
    color: Colors.orange,
    fontSize: 10,
  );

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
      body: ListView.builder(
        padding: EdgeInsets.all(4),
        itemBuilder: (context, position) {
          return Card(
            child: Column(
              children: <Widget>[
                _rowTitle(),
                _rowCenter(),
                _rowButtom(),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }

  Widget _rowTitle() {
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
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.grey.shade500,
                  ),
                  onPressed: () {}),
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

  Widget _rowCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:16.0,right: 8,top: 8,bottom: 8),
          child: Text("we also talk about the future of work as the robots"),
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
            child: Image(
              image: ExactAssetImage("assets/images/BackGround.png"),
              fit: BoxFit.cover,
            ))
      ],
    );
  }

  Widget _rowButtom() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
