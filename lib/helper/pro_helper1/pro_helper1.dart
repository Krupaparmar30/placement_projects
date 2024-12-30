import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ProHelper
{
  String api="https://jsonplaceholder.typicode.com/todos";

  Future<List> proApiHelper() async {
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      List data = jsonDecode(json);
      return data;
    } else {
      return [];
    }
  }
}
