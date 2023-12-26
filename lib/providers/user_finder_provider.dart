import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserFinderProvider extends ChangeNotifier {
  final List<UserModel> _userList = [];
  bool _loading = false;




  initLoading() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    setLoading(false);
  }


  void setLoading(loading) {
    _loading = loading;
    notifyListeners();
  }
  bool get loading => _loading;
  List<UserModel> get userList => _userList;
}
