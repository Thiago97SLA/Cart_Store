import 'package:flutter/material.dart';

class Providersstate with ChangeNotifier {
  dynamic _listproducts;
  get listproducts => _listproducts;
  set setlistproducts(dynamic listproducts) {
    this._listproducts = listproducts;
    notifyListeners();
  }
}
