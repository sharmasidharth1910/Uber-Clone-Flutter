import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class RequestAssistant {
  static Future<dynamic> getRequest({@required String url}) async {
    http.Response response = await http.get(Uri.dataFromString(url));

    try {
      if (response.statusCode == 200) {
        String jsondata = response.body;
        var decodeData = jsonDecode(jsondata);
        return decodeData;
      } else {
        return "failed";
      }
    } catch (error) {
      return "failed";
    }
  }
}