import 'dart:math';

import 'package:flutter/material.dart';

class AddService extends StatefulWidget {
  @override
  _AddServiceState createState() => _AddServiceState();
}

List<Color> listColors = [
  Colors.greenAccent,
  Colors.green,
  Colors.cyan,
  Colors.amber,
  Colors.red,
  Colors.blue,
];

Random randomIndex = Random();

class _AddServiceState extends State<AddService> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: <Widget>[
              _drawRowTitle(),
              _drawDescriptionRow(),
            ],
          ),
        );
      },
      itemCount: 20,
    );
  }

  Widget _drawRowTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: ExactAssetImage("assets/images/BackGround.png"),
                    fit: BoxFit.cover,
                  )),
              width: 48,
              height: 48,
              margin: EdgeInsets.only(
                left: 16,
                right: 4,
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  "Mahmoud ragab",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 8,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "15 Min   ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "- Life Style",
                        style: TextStyle(
                            color: _color(), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        IconButton(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
            onPressed: () {})
      ],
    );
  }

  Widget _drawDescriptionRow() {
    return Row(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("assets/images/BackGround.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(6)),
          margin: EdgeInsets.only(left: 12, top: 12, bottom: 12),
          width: 120,
          height: 120,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Tech Tent : Old Phones and safe social",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  "we also talk about the future of work as the robots advance, and we ask retro phone  ",
                  style: TextStyle(
                      fontSize: 14, color: Colors.grey, wordSpacing: 1.5),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Color _color() {
    return listColors[randomIndex.nextInt(listColors.length)];
  }
}
