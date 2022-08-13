import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weather_app/model/weather_model/weather_model.dart';
import 'package:weather_app/service/api_service.dart';

class WeatherController extends GetxController {
  var isLoading = true.obs;
  var isError = false.obs;
  var weatherData = WeatherModel().obs;

  // @override
  // void onInit() {
  //   getWeatherData();
  //   super.onInit();
  // }

  Future<void> getWeatherData(
      {Position? userLocation, String? savedPlace}) async {
    isLoading(true);
    isError(false);
    final weatherResult;
    if (userLocation != null) {
      weatherResult = await ApiService().getWeather(usrLocation: userLocation);
    } else {
      weatherResult = await ApiService().getWeather(place: savedPlace);
    }
    log('$weatherResult');
    weatherResult.fold((failure) {
      isLoading(false);
      isError(true);
    }, (success) {
      isLoading(false);
      isError(false);
      weatherData(success);
    });
  }
}
