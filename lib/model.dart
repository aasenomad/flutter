import 'package:flutter/material.dart';

/// app model class
class App {
  String name;
  int id;
  bool showCards = false;
  List<Item> items;
}

/// item model class
class Item {
  int id;
  String title;
  String topText;
  String middleText;
  String bottomText;
  List<TileItem> tileItem = [];

  Item(
      {this.id,
      this.title,
      this.topText,
      this.bottomText,
      this.middleText,
      this.tileItem});
}

/// tile item model class
class TileItem {
  final String topText;
  final String middleText;
  final String bottomText;

  TextStyle defaultStyle = TextStyle(color: Colors.white, fontSize: 14.0);
  TextStyle topStyle = TextStyle(color: Colors.white);
  TextStyle middleStyle = TextStyle(color: Colors.white);
  TextStyle bottomStyle = TextStyle(color: Colors.white);

  TileItem(
      {@required this.topText,
      @required this.middleText,
      @required this.bottomText,
      TextStyle topStyle,
      TextStyle middleStyle,
      TextStyle bottomStyle}) {
    this.topStyle = topStyle == null ? defaultStyle : topStyle;
    this.middleStyle = middleStyle == null ? defaultStyle : middleStyle;
    this.bottomStyle = bottomStyle == null ? defaultStyle : bottomStyle;
  }
}
