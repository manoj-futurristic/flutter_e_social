import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  void setLoadig(loading) {
    _loading = loading;
    notifyListeners();
  }

  initLoading() async {
    setLoadig(true);
    await Future.delayed(const Duration(seconds: 1));
    setLoadig(false);
  }
}
