import 'dart:convert';

import 'package:flutter_app/models/category.dart';
import 'package:flutter_app/utilities/api_Utilities.dart';
import 'package:http/http.dart' as http;

class categoriesApis {
  Future<List<Category>> fetchCategories() async {
    List<Category> Categories = List<Category>();
    String URL = address + post_catagory;
    var Respond = await http.get(URL);

    if (Respond.statusCode == 200) {
      var jasondata = jsonDecode(Respond.body);
      var data = jasondata["data"];
      for (var item in data) {
        Categories.add(Category(
          item["id"].toString(),
          item["titel"].toString(),
        ));
      }
    }
    return Categories;
  }
}
