import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  var isLocationLoading = false;

  getLocationData() async {
    isLocationLoading = true;
    update();
    LocationPermission permissionCheck = await Geolocator.checkPermission();

    if (permissionCheck == LocationPermission.denied) {
      LocationPermission reqResult = await Geolocator.requestPermission();
      if (reqResult == LocationPermission.denied) {
        exit(0);
        return;
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    isLocationLoading = false;
    update();
    return position;
  }
}
