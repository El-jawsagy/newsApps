import 'package:flutter/material.dart';
import 'package:flutter_app/shared_ui/drawerNavigation.dart';

class twitterFeeds extends StatefulWidget {
  @override
  _twitterFeedsState createState() => _twitterFeedsState();
}

class _twitterFeedsState extends State<twitterFeeds> {
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
      body: ListView.builder(padding: EdgeInsets.all(8.0),
        itemBuilder: (context, position) {
          return Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16,
                ),
                child: Column(
                  children: <Widget>[
                    _rowTitle(),
                    _rowCenter(),
                    _drawLine(),
                    _rowBottom(),
                  ],
                ),
              ),
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
                      padding: const EdgeInsets.only(right:4.0),
                      child: Text(
                        "Mahmoud Ragab",
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
                children: <Widget>[Text("Fri,12 May 2017 - 14.30",style: TextStyle(color: Colors.grey.shade500),)],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _rowBottom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: Colors.amber.shade700,
                ),
                onPressed: () {}),
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

  Widget _rowCenter() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        "we also talk about the future of work as the robots advance, and we ask retro phone",
        style: TextStyle(wordSpacing: 1.25, fontSize: 16,height: 1.2,),
      ),
    );
  }

 Widget _drawLine() {
    return  Container(
      color: Colors.grey.shade200,
      height: 1,
    );
 }
}
