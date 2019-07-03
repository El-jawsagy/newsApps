import 'package:flutter/material.dart';

class nav_Model{
  String _title;
  Function _diractor ;
  IconData _iconDataNav ;

  nav_Model(this._title, this._diractor,this._iconDataNav);

  Function get diractor => _diractor;

  String get title => _title;

  IconData get iconDataNav => _iconDataNav;


}