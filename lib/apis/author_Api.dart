import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/models/authers.dart';
import 'package:flutter_app/utilities/api_Utilities.dart';
import 'package:http/http.dart' as http;

class AuthorApis {
  Future<List<author>> fetchAuthors() async {
    List<author> Authers = List<author>();
    String URL = address +authors;
    var Response = await http.get(URL);
    if (Response.statusCode == 200) {
      var JsonData = jsonDecode(Response.body);
      var data = JsonData["data"];
      for (var item in data) {
        author newAuther= author(item["id"].toString(),
          item["name"].toString(),
          item["email"].toString(),
          item["avatar"].toString(),);
        Authers.add(newAuther);
        print(newAuther.name);

      }
    }

    return Authers;
  }
}
