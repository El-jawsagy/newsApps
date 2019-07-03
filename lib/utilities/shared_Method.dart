import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
String differentTime(String date_written) {
  Duration timeAgo = DateTime.now().difference(DateTime.parse(date_written));
  DateTime theDif = DateTime.now().subtract(timeAgo);
  return timeago.format(theDif);
}

Widget connectionError() {
  return Center(
      child: Container(
        child: Text(
          "connection Error",
          style: TextStyle(fontSize: 24),
        ),
      ));
}

Widget loading() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Center(child: CircularProgressIndicator()),
  );
}

Widget error(Object error) {
  return Center(
    child: Container(
      child: Text(error.toString()),
    ),
  );
}

Widget noData() {
  return Center(child: Container(child: Text(" No Data",style: TextStyle(fontSize: 20),),));
}