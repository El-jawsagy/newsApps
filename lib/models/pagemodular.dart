import 'package:flutter/material.dart';

class pagemodular{
  String _image  ;
  String _welcome;
  String _description;
  IconData _icon;

  pagemodular(this._image, this._welcome, this._description, this._icon);

  IconData get icon => _icon;

  String get description => _description;

  String get welcome => _welcome;

  String get image => _image;


}