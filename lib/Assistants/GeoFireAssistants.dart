import 'package:rider_app/Models/NearByAvailableDrivers.dart';

class GeoFireAssistants {
  static List<NearByDrivers> nearbyAvailableDriversList = [];

  static void removeDriverFromList(String key) {
    int index =
        nearbyAvailableDriversList.indexWhere((element) => element.key == key);

    nearbyAvailableDriversList.removeAt(index);
  }

  static void updateDriverNearbyLocation(NearByDrivers driver) {
    int index = nearbyAvailableDriversList
        .indexWhere((element) => element.key == driver.key);
    nearbyAvailableDriversList[index].latitude = driver.latitude;
    nearbyAvailableDriversList[index].longitude = driver.longitude;
  }
}
