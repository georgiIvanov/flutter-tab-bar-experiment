import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TabBarModel {
  var icons = <IconData>[];
  var titles = <String>[];
  var widgets = <Widget>[];

  TabBarModel(List<IconData> icons) {
    this.icons = icons;
  }
}

class TabBarNotifier extends ChangeNotifier {
  TabBarModel model = TabBarModel([
    CupertinoIcons.home,
    Icons.dangerous,
    Icons.airplanemode_off,
    CupertinoIcons.home,
    Icons.dangerous,
    Icons.airplanemode_off
  ]);

  void addTab(IconData icon) {
    model.icons.add(icon);
    notifyListeners();
  }
}
