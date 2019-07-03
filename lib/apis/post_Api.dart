import 'dart:convert';

import 'package:flutter_app/models/post.dart';
import 'package:flutter_app/utilities/api_Utilities.dart';
import 'package:http/http.dart' as http;

class PostApi {
  Future<List<post>> fetchPost(String id) async {
    List<post> Posts = List<post>();
    String URL = address + post_catagory+id;
    var Respond = await http.get(URL);

    if (Respond.statusCode == 200) {
      var jasonData = jsonDecode(Respond.body);
      var data = jasonData["data"];
      for (var item in data) {
        post temp = post(
          id: item["id"],
          title: item["title"],
          content: item["content"],
          date_written: item["date_written"],
          featured_image: item["featured_image"],
          voters_down:
              (item["voters_down"] == null ? List<int>() : item["voters_down"]),
          voters_up:
              (item["voters_up"] == null ? List<int>() : item["voters_up"]),
          votes_down: item["votes_down"],
          votes_up: item["votes_up"],
          created_at: item["created_at"],
          updated_at: item["updated_at"],

        );
        print(temp.title);
        Posts.add(temp);
      }
    }
    return Posts;
  }
}
