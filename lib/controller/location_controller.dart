import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/view/home/home_page.dart';

class LocationController extends GetxController {
  var isLocationLoading = false.obs;

  Future<void> getLocationData() async {
    isLocationLoading(true);
    LocationPermission permissionCheck = await Geolocator.checkPermission();

    if (permissionCheck == LocationPermission.denied) {
      LocationPermission reqResult = await Geolocator.requestPermission();
      if (reqResult == LocationPermission.denied) {
        exit(0);
        return;
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    print(position);
    isLocationLoading(false);
    Get.off(HomePage(
      usrLocation: position,
    ));
  }
}
