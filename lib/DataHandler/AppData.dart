import 'package:flutter/cupertino.dart';
import 'package:rider_app/Models/Address.dart';

class AppData extends ChangeNotifier {
  Address pickUpLocation;
  Address dropOffLocation;

  void updatePickUpLocationAddress({Address pickUpAddress}) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress({Address dropOffAddress}) {
    dropOffLocation = dropOffAddress;
    notifyListeners();
  }
}
