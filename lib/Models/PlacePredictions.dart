import 'package:flutter/foundation.dart';

class PlacePredictions {
  // ignore: non_constant_identifier_names
  String secondary_text;
  // ignore: non_constant_identifier_names
  String main_text;
  // ignore: non_constant_identifier_names
  String place_id;

  PlacePredictions({
    // ignore: non_constant_identifier_names
    @required this.secondary_text,
    // ignore: non_constant_identifier_names
    @required this.main_text,
    // ignore: non_constant_identifier_names
    @required this.place_id,
  });

  PlacePredictions.fromJson(Map<String, dynamic> json) {
    this.main_text = json["structured_formatting"]["main_text"];
    this.place_id = json["place_id"];
    this.secondary_text = json["structured_formatting"]["secondary_text"];
  }
}
