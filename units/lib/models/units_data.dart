
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class UnitsData with ChangeNotifier {
  //A map that will hold a key/value objects from jason file

  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';
  String _username = '';

// username will be used in the textfield for passing data when the user interacts with the app by inputing the unit number he/she wants.
  String get username => _username;
  set username(String username) {
    _username = username;
    notifyListeners();
  }

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

//I used the future to fetch data of json file from the internet.
  Future<void> get fetchData async {
    final response = await get(
      Uri.parse(
          'https://dl.dropbox.com/s/bqop1r0plejx1ez/Units%201-3.json?dl=0'),
    );

// The error message will be shown if the application takes a lot of time to fetch json data or when the internet is very slow in terms of loading.
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error: It could be your internet connection?';
      _map = {};
    }
    notifyListeners();
  }

  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
