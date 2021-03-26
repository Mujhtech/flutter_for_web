import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Globals {
  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  static ScrollController scrollController =
      ScrollController(initialScrollOffset: 25.0);
  static ItemScrollController itemScrollController = ItemScrollController();
  static ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();

  static scroll(int i) {
    itemScrollController.scrollTo(index: i, duration: Duration(seconds: 1));
  }
}
