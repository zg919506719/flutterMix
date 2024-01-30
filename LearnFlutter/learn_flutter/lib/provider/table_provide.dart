import 'package:flutter/cupertino.dart';

class TableProvide extends ChangeNotifier {
  String page = "";

  String get pageShow => page;

  void setPage(String page) {
    this.page = page;
    notifyListeners();
  }
}
