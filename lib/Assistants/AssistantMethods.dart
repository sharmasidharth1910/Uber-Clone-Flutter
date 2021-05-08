import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/Assistants/requestAssistant.dart';
import 'package:rider_app/Credentials/ConfigMaps.dart';
import 'package:rider_app/DataHandler/AppData.dart';
import 'package:rider_app/Models/Address.dart';
import 'package:rider_app/Models/DirectionDetails.dart';

class AssistantMethods {
  static Future<String> searchCoordinateAddress({
    @required Position position,
    @required BuildContext context,
  }) async {
    String placeAddress = "";
    String str1, str2, str3, str4;
    String url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$apiKey";

    var response = await RequestAssistant.getRequest(url: url);

    if (response != "failed") {
      //placeAddress = response["results"][0]["formatted_address"];

      str1 = response["results"][0]["address_components"][3]["long_name"];
      str2 = response["results"][0]["address_components"][4]["long_name"];
      str3 = response["results"][0]["address_components"][5]["long_name"];
      str4 = response["results"][0]["address_components"][6]["long_name"];

      placeAddress = str1 + " " + str2 + " " + str3 + " " + str4;

      Address userPickupAddress = Address();
      userPickupAddress.latitude = position.latitude;
      userPickupAddress.longitude = position.longitude;
      userPickupAddress.placeName = placeAddress;

      Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(
        pickUpAddress: userPickupAddress,
      );
    }

    return placeAddress;
  }

  static Future<DirectionDetails> obtainPlaceDirectionDetails(
      {LatLng initialPosition, LatLng finalPosition}) async {
    String directionUrl =
        "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$apiKey";

    var res = await RequestAssistant.getRequest(url: directionUrl);

    if (res == "failed") {
      return null;
    }

    DirectionDetails directionDetails = DirectionDetails();
    directionDetails.encodedPoints =
        res["routes"][0]["overview_polyline"]["points"];
    directionDetails.distanceText =
        res["routes"][0]["legs"][0]["distance"]["text"];
    directionDetails.distanceValue =
        res["routes"][0]["legs"][0]["distance"]["value"];
    directionDetails.durationText =
        res["routes"][0]["legs"][0]["duration"]["text"];
    directionDetails.durationValue =
        res["routes"][0]["legs"][0]["duration"]["value"];

    return directionDetails;
  }
}
