import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class BookProvider with ChangeNotifier {
  Map _result = {};

  Map get result => _result;

  void setResult(Map queryResult) {
    _result = queryResult;
    notifyListeners();
  }

  Future<void> onSearch(params) async {
    var api = 'https://www.googleapis.com/books/v1/volumes?q=';
    Uri url = Uri.parse(api + params);

    await http
        .get(url)
        .then((res) => {setResult(jsonDecode(res.body)), print(res.body)});
  }
}
