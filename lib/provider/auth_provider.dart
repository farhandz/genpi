import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  List<dynamic> _dataUser = [];
  List<dynamic> get dataUser => _dataUser;

  set dataUser(List<dynamic> dataUser) {
    _dataUser = dataUser;
    notifyListeners();
  }
}
